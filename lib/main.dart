import 'package:flutter/material.dart';
import 'package:ios_calculator/Widgets/History.dart';
import 'package:ios_calculator/Widgets/provider.dart';
import 'package:provider/provider.dart';
import 'Widgets/my_app.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Result()),
      ],
      child: MyApp(),
    ));
