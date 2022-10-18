import 'package:app/presentation/resourse/routs_manager.dart';
import 'package:app/presentation/resourse/theme_manager.dart';
import 'package:app/presentation/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// MyApp is a Singleton
//factory = static constructor
//
class MyApp extends StatefulWidget
{
  MyApp._internal();


  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  factory MyApp.jason(String name)
  {
    return _instance;
  }



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
