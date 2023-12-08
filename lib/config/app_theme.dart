import 'package:flutter/material.dart';

class ThemeClass{
  static ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size.fromHeight(56),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
        backgroundColor: const Color(0xFF111111),
        textStyle: const TextStyle(fontFamily: "Urbanist", fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFFFFFFFF))
      )
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        foregroundColor: const Color(0xFFFFCE5C),
        textStyle: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFFFCE5C))
      )
    ),
  );
}