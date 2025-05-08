import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GlobalAppTheme {

static final Color primaryColor = HexColor('#00C569');

static ThemeData getThemeData() {
  return ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: HexColor('#a8a7a7'),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: HexColor('#a8a7a7'),
      selectionHandleColor: primaryColor, 
      cursorColor: primaryColor, 
    ),
  );
}
}