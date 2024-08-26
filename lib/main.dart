import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      routes: {
      HomeScreen.routeName: (_)=> HomeScreen()
      },
       theme: appTheme.lightTheme,
      themeMode: ThemeMode.light
        );

  }
}
