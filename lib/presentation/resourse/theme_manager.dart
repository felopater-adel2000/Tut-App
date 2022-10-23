

import 'package:app/presentation/resourse/color_manager.dart';
import 'package:app/presentation/resourse/style_manager.dart';
import 'package:app/presentation/resourse/values_manager.dart';
import 'package:flutter/material.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme()
{
  return ThemeData(
    //main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    //cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.lightPrimary,
      titleTextStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)
    ),

    //button theme
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.lightPrimary,
    ),
    
    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s17),
          primary: ColorManager.error,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppPading.p12)
          )
      )
    ),

    //text theme
    textTheme: TextTheme(
      headlineMedium: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      displayLarge: getLightStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      titleMedium: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.grey1),
      bodySmall: getRegularStyle(color: ColorManager.grey)
    ),

    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPading.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle: getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      )
    )
  );
}