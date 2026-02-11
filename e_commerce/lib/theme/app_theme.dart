import 'package:e_commerce/theme/button_theme.dart';
import 'package:e_commerce/theme/input_decoration_theme.dart';
import 'package:flutter/material.dart' hide ButtonThemeData;
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'checkbox_themedata.dart';
import 'theme_data.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    // Apply Oswald to base theme
    final baseTheme = ThemeData.light();
    final oswaldTextTheme = GoogleFonts.oswaldTextTheme(baseTheme.textTheme);
    
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: primaryMaterialColor,
      primaryColor: const Color.fromARGB(255, 97, 192, 255),
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: blackColor),
      
      // Apply Oswald to text theme
      textTheme: oswaldTextTheme.copyWith(
        bodyMedium: oswaldTextTheme.bodyMedium?.copyWith(color: blackColor40),
      ),
      
      // CORRECT: Create ElevatedButtonThemeData with the style
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonThemeData.elevatedButtonStyle,
      ),
      
      // CORRECT: Create TextButtonThemeData with the style
      textButtonTheme: TextButtonThemeData(
        style: ButtonThemeData.textButtonStyle,
      ),
      
      // CORRECT: Create OutlinedButtonThemeData with the style
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonThemeData.outlinedButtonStyle,
      ),
      
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
}