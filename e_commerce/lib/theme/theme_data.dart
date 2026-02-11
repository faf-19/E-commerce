import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

final AppBarTheme appBarLightTheme = AppBarTheme(
  backgroundColor: Colors.white,
  elevation: 0,
  iconTheme: const IconThemeData(color: blackColor),
  titleTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: blackColor,
    fontFamily: GoogleFonts.oswald().fontFamily, // Add Oswald font
  ),
);

final AppBarTheme appBarDarkTheme = AppBarTheme(
  backgroundColor: blackColor,
  elevation: 0,
  iconTheme: const IconThemeData(color: Colors.white),
  titleTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: GoogleFonts.oswald().fontFamily, // Add Oswald font
  ),
);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: MaterialStateProperty.all(primaryColor),
);

DataTableThemeData dataTableLightThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Colors.black12),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadious)),
    border: Border.all(color: Colors.black12),
  ),
  dataTextStyle: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: blackColor,
    fontFamily: GoogleFonts.oswald().fontFamily, // Add Oswald font
  ),
  headingTextStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: blackColor,
    fontFamily: GoogleFonts.oswald().fontFamily, // Add Oswald font
  ),
);

DataTableThemeData dataTableDarkThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Colors.white10),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadious)),
    border: Border.all(color: Colors.white10),
  ),
  dataTextStyle: TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 12,
    fontFamily: GoogleFonts.oswald().fontFamily, // Add Oswald font
  ),
  headingTextStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: GoogleFonts.oswald().fontFamily, // Add Oswald font
  ),
);

// Option 1: Create a complete TextTheme using Oswald
TextTheme oswaldTextThemeLight = GoogleFonts.oswaldTextTheme(
  ThemeData.light().textTheme,
);

TextTheme oswaldTextThemeDark = GoogleFonts.oswaldTextTheme(
  ThemeData.dark().textTheme,
);

// Option 2: Or you can apply it globally in your MaterialApp
/*
MaterialApp(
  theme: ThemeData(
    textTheme: GoogleFonts.oswaldTextTheme(
      ThemeData.light().textTheme,
    ),
  ),
  darkTheme: ThemeData(
    textTheme: GoogleFonts.oswaldTextTheme(
      ThemeData.dark().textTheme,
    ),
  ),
)
*/