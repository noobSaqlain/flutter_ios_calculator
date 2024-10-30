import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/calc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATOR',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              surface: Colors.black,
              primary: Colors.grey,
              onPrimary: Colors.amber[700],
              onSecondary: Colors.grey[800],
              onSurface: Colors.white),
          buttonTheme: const ButtonThemeData(padding: EdgeInsets.all(10.0))),
      home: Calculator(),
    );
  }
}
