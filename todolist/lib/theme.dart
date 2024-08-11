import 'package:flutter/material.dart';

// Define the light theme
final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.blue,
    elevation: 4,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18),
  ),
  scaffoldBackgroundColor: Colors.white,
  
);

// Define the dark theme
final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    color: Colors.black,
    elevation: 4,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blueAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18),
  ),
  scaffoldBackgroundColor: Colors.grey[900],
);
