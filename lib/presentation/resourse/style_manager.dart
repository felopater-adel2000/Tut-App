
import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color)
{
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight
  );
}

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) => _getTextStyle(fontSize, FontWeightManager.regular, color);

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) => _getTextStyle(fontSize, FontWeightManager.medium, color);


// medium style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) => _getTextStyle(fontSize, FontWeightManager.light, color);


// bold style

TextStyle getBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) => _getTextStyle(fontSize, FontWeightManager.bold, color);


// semibold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) => _getTextStyle(fontSize, FontWeightManager.semiBold, color);
