import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_scheme.dart';

TextTheme customTextTheme(BuildContext context){

  return TextTheme(
      bodyLarge: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: lightColorScheme.onPrimary
          )
      ),
      bodyMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: lightColorScheme.onSecondary
          )
      ),
      bodySmall: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: lightColorScheme.onPrimary
          )
      ),
    titleSmall: GoogleFonts.poppins(
        textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: lightColorScheme.onError
        ),

    )
  );
}