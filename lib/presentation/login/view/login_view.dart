import 'package:app/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:app/presentation/resourse/color_manager.dart';
import 'package:app/presentation/resourse/values_manager.dart';
import 'package:flutter/material.dart';

import '../../resourse/asste_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> 
{
  final LoginViewModel _viewModel = LoginViewModel(_loginUseCase);

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey();

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
    return Container();
  }

  Widget _getConyentWidget()
  {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: AppPading.p100, bottom: AppPading.p100),
        color: ColorManager.white,
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
                        hintText:
                      ),
                    ),
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
