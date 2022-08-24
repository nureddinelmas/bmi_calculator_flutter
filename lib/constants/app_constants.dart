import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor mainColor = Colors.teal;

  static const String appTitle = "BMI Calculator";

  static final TextStyle appBarStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 20, fontWeight: FontWeight.w600, color: mainColor);

  static final TextStyle averageValueStyle = GoogleFonts.quicksand(
      fontSize: 45, fontWeight: FontWeight.w800, color: mainColor);
}
