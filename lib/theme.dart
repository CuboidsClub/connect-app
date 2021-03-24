import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.red),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData();
