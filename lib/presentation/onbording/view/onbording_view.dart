import 'package:app/domain/model/models.dart';
import 'package:app/presentation/onbording/viewmodel/onboarding_viewmodel.dart';
import 'package:app/presentation/resourse/asste_manager.dart';
import 'package:app/presentation/resourse/color_manager.dart';
import 'package:app/presentation/resourse/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../resourse/routs_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
{

  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind()
  {
    _viewModel.start();
  }

  @override
  void initState()
  {
    _bind();
    super.initState();
  }
  @override
  void dispose()
  {
    _viewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot)
      {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject)
  {
    if(sliderViewObject == null)
      {
        return Container();
      }
    else
      {
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: ColorManager.white
            ),
          ),
          body: PageView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => OnBoardingPage(sliderViewObject.sliderObject),
            controller: _pageController,
            itemCount: sliderViewObject.numberOfSlides,
            onPageChanged: (index)
            {
              _viewModel.onPageChange(index);
            },
          ),
          bottomSheet: Container(
            color: ColorManager.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      "SKIP",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: ColorManager.primary
                      ),
                    ),
                  ),
                ),
                _getBottomSheetWidget(sliderViewObject)
              ],
            ),
          ),
        );
      }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject)
  {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(AppPading.p14),
            child: GestureDetector(
              onTap: (){
                _pageController.animateToPage(_viewModel.goPrevious(), duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrow),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: sliderViewObject.numberOfSlides,
            effect: ScrollingDotsEffect(
              dotColor: ColorManager.darkGrey,
              activeDotColor: ColorManager.white,
              strokeWidth: 2,
              paintStyle: PaintingStyle.stroke,
              activeStrokeWidth: 4,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppPading.p14),
            child: GestureDetector(
              onTap: (){

                _pageController.animateToPage(_viewModel.goNext(), duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);
              },
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
            ),
          ),
        ],
      ),
    );
  }

}



class OnBoardingPage extends StatelessWidget
{
  final SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPading.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPading.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppPading.p60,),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}
