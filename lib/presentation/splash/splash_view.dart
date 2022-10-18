import 'dart:async';

import 'package:app/presentation/resourse/asste_manager.dart';
import 'package:app/presentation/resourse/color_manager.dart';
import 'package:app/presentation/resourse/constants_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resourse/routs_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
{
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.primary
        ),
      ),
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo),)),
    );
  }

  _startDelay()
  {
    _timer = Timer(Duration(seconds: AppConstants.splashDelay), _goNext);
  }
  _goNext()
  {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
