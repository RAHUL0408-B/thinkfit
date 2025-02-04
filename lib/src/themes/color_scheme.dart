import 'package:flutter/material.dart';

const Color primary = Color(0xff99bdfe);
const Color onPrimary = Colors.white;
const Color secondary = Color(0xff93a6fd);
const Color onSecondary = Colors.black;
const Color surface = Color(0xffcf91ea);
const Color onSurface = Color(0xffe19cdb);
ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    error: Colors.red,
    onError: Colors.grey,
    surface: surface,
    onSurface: onSurface);
