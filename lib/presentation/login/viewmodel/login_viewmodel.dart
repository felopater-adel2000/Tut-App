import 'dart:async';

import 'package:app/app/testing.dart';
import 'package:app/domain/usecase/login_usecase.dart';
import 'package:app/presentation/base/base_viewmodel.dart';
import 'package:app/presentation/common/freezed_data_classes.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput, LoginViewModelOutput
{

  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  final StreamController _areAllInputValidStreamController = StreamController<void>.broadcast();

  var loginObject = LoginObject("userName", "password");

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);
  // LoginViewModel();
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputValidStreamController.close();
  }

  @override
  void start() {

  }

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputValid => _areAllInputValidStreamController.stream.map((event) => _areInputValid());

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAreAllAllValidate => _areAllInputValidStreamController.sink;

  bool _isPasswordValid(String password)
  {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName)
  {
    return userName.isNotEmpty;
  }
  bool _areInputValid()
  {
    return _isPasswordValid(loginObject.password) && _isUserNameValid(loginObject.userName);
  }

  @override
  login() async
  {
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.userName, loginObject.password)))
    .fold((failure){
      Log.e(failure.message);
    }, (data){
      Log.d(data.customer?.name ?? "NA");
    });
  }

  @override
  setPassword(String password)
  {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllAllValidate.add(null);
  }

  @override
  setUserName(String userName)
  {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllAllValidate.add(null);
  }
}

abstract class LoginViewModelInput
{
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreAllAllValidate;
}

abstract class LoginViewModelOutput
{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputValid;
}




