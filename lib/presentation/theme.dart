import 'package:flutter/material.dart';

const _primaryColor = Color(0xFF28AE54);
const _backgroundColor = Color(0xFFF2F9F5);
ThemeData appTheme = ThemeData(
    primaryColor: _primaryColor,
    backgroundColor: _backgroundColor,
    toggleableActiveColor: _primaryColor,
    colorScheme: const ColorScheme.light(
      primary: _primaryColor, // header background color
      onPrimary: Colors.white, // header text color
      onSurface: _primaryColor, // body text color
    ),
    textTheme: const TextTheme(
        headline5: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        caption: TextStyle(
            color: _primaryColor, fontWeight: FontWeight.bold, fontSize: 16.0),
        button: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white)),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _primaryColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: Colors.white,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _primaryColor, width: 2.0)),
        labelStyle: TextStyle(color: _primaryColor)),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _primaryColor),
    ));
