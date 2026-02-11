import 'package:flutter/material.dart';
import '../constants.dart';

// Define the button styles
class ButtonThemeData {
  // Elevated Button Style
  static final elevatedButtonStyle = ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
  );

  // Text Button Style
  static final textButtonStyle = TextButton.styleFrom(
    foregroundColor: primaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  );

  // Outlined Button Style
  static final outlinedButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
  );
}