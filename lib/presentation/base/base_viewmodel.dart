abstract class BaseViewModel implements IBaseViewModelInput, IBaseViewModelOutput
{

}

abstract class IBaseViewModelInput
{
  void start();
  void dispose();
}

abstract class IBaseViewModelOutput
{

}