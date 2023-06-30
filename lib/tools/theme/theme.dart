import 'package:flutter/material.dart';

import '../style/shapes.dart';
import 'colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'vazir',
    dialogBackgroundColor: whiteColor,
    colorScheme:
        ColorScheme.light(primary: primaryColor, background: backGroundColor),
    dialogTheme: DialogTheme(shape: getShapeWidget(15), elevation: 5),
    scaffoldBackgroundColor: backGroundColor,
    iconTheme: const IconThemeData().copyWith(
      color: darkColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor, elevation: 5),
    cardTheme: const CardTheme(color: whiteColor, elevation: 3),
    //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: getShapeWidget(10),
        fixedSize: const Size(120, 40),
        alignment: Alignment.center,
        backgroundColor: primaryColor,
        textStyle: const TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'vazir',
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: getShapeWidget(10),
        alignment: Alignment.center,
        textStyle: const TextStyle(
          color: whiteColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'vazir',
        ),
      ),
    ),
    shadowColor: greyColor.withOpacity(0.6),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      actionsIconTheme: IconThemeData(color: darkColor),
      elevation: 1,
      iconTheme: IconThemeData(color: darkColor),
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: darkColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
    ),

    //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: textFieldColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.5),
        gapPadding: 10,
        borderSide: const BorderSide(color: borderColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.5),
        gapPadding: 10,
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(7.5),
        gapPadding: 10,
        borderSide: BorderSide(color: darkColor.withOpacity(0.0), width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(7.5),
        borderSide: BorderSide(color: darkColor.withOpacity(0.0), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(7.5),
        borderSide: BorderSide(color: darkColor.withOpacity(0.0), width: 1),
      ),
      iconColor: darkColor,
      suffixIconColor: darkColor,
      labelStyle: TextStyle(
        fontFamily: 'vazir',
        color: darkColor.withOpacity(0.8),
      ),
      hintStyle: TextStyle(
        fontFamily: 'vazir',
        color: darkColor.withOpacity(0.6),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    ),

    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(
        color: whiteColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
    ),
    //
    //
    //
    textTheme: TextTheme(
      bodySmall: const TextStyle(
        fontFamily: 'vazir',
        color: darkColor,
      ),
      bodyMedium: const TextStyle(
        fontFamily: 'vazir',
        color: darkColor,
      ),
      bodyLarge: const TextStyle(
        fontFamily: 'vazir',
        color: darkColor,
      ),
      //
      titleSmall: const TextStyle(
        color: whiteColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        color: darkColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        color: whiteColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
      //
      labelSmall: const TextStyle(
        color: darkColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: primaryColor,
        fontFamily: 'vazir',
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: Colors.grey[500],
        fontFamily: 'vazir',
      ),
      //
      //
    ),
  );
}
