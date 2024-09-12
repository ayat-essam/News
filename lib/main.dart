import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home/view/screen/homescreen.dart';
import 'package:news/news/articale.dart';

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
      HomeScreen.routeName: (_)=> HomeScreen(),
        // articleImage.routeName: (_)=> articleImage()
      },
       theme: appTheme.lightTheme,
      themeMode: ThemeMode.light
        );

  }
}
