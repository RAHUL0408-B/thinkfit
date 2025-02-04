import 'package:fitnest_app/src/themes/color_scheme.dart';
import 'package:fitnest_app/src/themes/text_theme.dart';
import 'package:flutter/material.dart';


ThemeData appTheme(BuildContext context,) {
  return ThemeData(
    colorScheme: lightColorScheme,
    textTheme: customTextTheme(context),
    primaryColor:  lightColorScheme.primary ,
    scaffoldBackgroundColor:  lightColorScheme.onPrimary,

  );
}