import 'package:app/app/di.dart';
import 'package:app/data/data_sourse/remote_data_sourse.dart';
import 'package:app/data/network/app_api.dart';
import 'package:app/data/network/network_info.dart';
import 'package:app/data/repository/repository_implementer.dart';
import 'package:app/domain/repository/repository.dart';
import 'package:app/domain/usecase/login_usecase.dart';
import 'package:app/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:app/presentation/resourse/color_manager.dart';
import 'package:app/presentation/resourse/strings_manager.dart';
import 'package:app/presentation/resourse/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../resourse/asste_manager.dart';
import '../../resourse/routs_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> 
{
  //*Hard Method to init variable, but we will use "Dependency Injection"*//
  // late AppServiceClient _appServiceClient;
  // late RemoteDataSource _remoteDataSource;
  // late NetworkInfo _networkInfo;
  // late Repository _repository ;
  //  late LoginUseCase _loginUseCase ;
  //  late LoginViewModel _viewModel ;

  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey();

  // LoginViewState()
  // {
  //   // _appServiceClient = AppServiceClient(dio)
  //   // _remoteDataSource = RemoteDataSourceImplementation(_appServiceClient);
  //   // _networkInfo = NetworkInfoImplementer(InternetConnectionChecker());
  //   // _repository = RepositoryImplementer(_remoteDataSource, _networkInfo);
  //   // _loginUseCase = LoginUseCase(_repository);
  //   // _viewModel = LoginViewModel(_loginUseCase);
  // }

  _bind()
  {
    _viewModel.start();
    _userNameController.addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
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
    super.dispose();
    _viewModel.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget()
  {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        padding: EdgeInsets.only(top: AppPading.p100, bottom: AppPading.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                Center(child: Image(image: AssetImage(ImageAssets.splashLogo),)),
                SizedBox(height: AppSize.s28,),
                Padding(
                  padding: EdgeInsets.only(left: AppPading.p28, right: AppPading.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outIsUserNameValid,
                    builder: (context, snapshot) => TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: StringsManager.username,
                        labelText: StringsManager.username,
                        errorText: (snapshot.data ?? true) ? null : StringsManager.usernameError
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s28,),
                Padding(
                  padding: EdgeInsets.only(left: AppPading.p28, right: AppPading.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outIsPasswordValid,
                    builder: (context, snapshot) => TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          hintText: StringsManager.password,
                          labelText: StringsManager.password,
                          errorText: (snapshot.data ?? true) ? null : StringsManager.passwordError
                      ),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s28,),
                Padding(
                  padding: EdgeInsets.only(left: AppPading.p28, right: AppPading.p28),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.outAreAllInputValid,
                    builder: (context, snapshot) => SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false) ? (){
                          _viewModel.login();
                        } : null,
                        child: Text(StringsManager.login),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppPading.p28, right: AppPading.p28, top: AppPading.p8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          StringsManager.forgetPassword,
                          style: TextStyle(
                              color: ColorManager.primary
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, Routes.registerRoute);
                        },
                        child: Text(
                          StringsManager.registerText,
                          style: TextStyle(
                              color: ColorManager.primary
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
