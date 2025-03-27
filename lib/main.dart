import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widget/expence.dart';

var kColorSheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kDarkColorSheme = ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 5, 99, 125), brightness: Brightness.dark);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorSheme,
      cardTheme: CardTheme().copyWith(
          color: kDarkColorSheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorSheme.onPrimaryContainer,
              foregroundColor: kDarkColorSheme.onPrimary)),
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorSheme.onPrimaryContainer,
          foregroundColor: kDarkColorSheme.onPrimary),
    ),

    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorSheme,
      cardTheme: CardTheme().copyWith(
          color: kColorSheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorSheme.onPrimaryContainer,
              foregroundColor: kColorSheme.onPrimary)),
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorSheme.onPrimaryContainer,
          foregroundColor: kColorSheme.onPrimary),
    ),
//themeMode:ThemeMode.system,default
    home: MyApp(),
  ));
}
