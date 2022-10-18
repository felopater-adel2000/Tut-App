import 'package:app/presentation/forgot_password/forgot_password_view.dart';
import 'package:app/presentation/login/view/login_view.dart';
import 'package:app/presentation/onbording/view/onbording_view.dart';
import 'package:app/presentation/rejester/rejester_view.dart';
import 'package:app/presentation/resourse/strings_manager.dart';
import 'package:app/presentation/splash/splash_view.dart';
import 'package:app/presentation/store_details/stored_details_view.dart';
import 'package:flutter/material.dart';

import '../main/main_view.dart';

class Routes
{
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
  static const String onBoardingRoute = "/onBoarding";

}

class RouteGenerator
{
  static Route<dynamic> getRoute(RouteSettings settings)
  {
    switch (settings.name)
    {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoredDetailsView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingView());
      default:
        return unDefindRoute();
    }
  }

  static Route<dynamic> unDefindRoute()
  {
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(),
      body: Container(child: Text(StringsManager.noRouteFound),),
    ));
  }
}