import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class appTheme{
  static const Color primary = Color(0xff39A552);
  static const Color navy = Color(0xff4F5A69);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff303030);
  static const Color gray = Color(0xff79828B);


  static ThemeData lightTheme = ThemeData(
 primaryColor: primary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: appTheme.primary,
      foregroundColor: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(50),
          right: Radius.circular(50))),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 22,
        color: white
      )
    ),
      textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: white
      ),
          titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: black
          )
  ),



  );
  static ThemeData darkTheme = ThemeData(

  );
}
