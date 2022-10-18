import 'dart:async';
import 'package:app/domain/model/models.dart';
import 'package:app/presentation/base/base_viewmodel.dart';
import '../../resourse/asste_manager.dart';
import '../../resourse/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInput , OnBoardingViewModelOutput
{
  late final List<SliderObject> _list;
  int _currentPageIndex = 0;

  final StreamController<SliderViewObject> _streamController = StreamController<SliderViewObject>();

  List<SliderObject> _getSliderData() => [
    SliderObject(StringsManager.onBoardingTitle1, StringsManager.subTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(StringsManager.onBoardingTitle2, StringsManager.subTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(StringsManager.onBoardingTitle3, StringsManager.subTitle3, ImageAssets.onBoardingLogo3),
    SliderObject(StringsManager.onBoardingTitle4, StringsManager.subTitle4, ImageAssets.onBoardingLogo4)
  ];
  @override
  void dispose()
  {
    _streamController.close();
  }

  @override
  void start()
  {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext()
  {
    int nextIndex = ++_currentPageIndex;
    if(nextIndex == _list.length) {nextIndex = 0;}
    return nextIndex;
  }

  @override
  int goPrevious()
  {
    int previousIndex = --_currentPageIndex;
    if(previousIndex == -1 ) {previousIndex = _list.length - 1;}
    return previousIndex;
  }

  @override
  void onPageChange(int index)
  {
    _currentPageIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView()
  {
    inputSliderViewObject.add(SliderViewObject(_list[_currentPageIndex], _list.length, _currentPageIndex));
  }


}

abstract class OnBoardingViewModelInput
{
  int goNext();
  int goPrevious();
  void onPageChange(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput
{
  Stream<SliderViewObject> get outputSliderViewObject;
}

