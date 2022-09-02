import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blueAccent,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        shadowColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black87 , fontSize: 20, fontWeight: FontWeight.w700),
        elevation: 0,
        centerTitle: true,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle) ,
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButton),
 
    );
  }
}


final ButtonStyle elevatedButton =  ElevatedButton.styleFrom(
  primary: Colors.black87,
  minimumSize: const Size(88, 48),
  padding: const EdgeInsets.symmetric(horizontal: 16),
);


final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  primary: Colors.black87,
  minimumSize: const Size(88, 48),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: const BorderSide(
    color: Colors.black87
  ),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  ),
);