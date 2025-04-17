import 'package:flutter/material.dart';

Color primary = const Color(0xff5591AB);
Color backgroundColor = const Color(0xffF1F3F6);

Color subtitleColor = Color.fromARGB(102, 90, 127, 196);
Color secondaryColor = const Color(0xffFFFFFF);
Color redColor = Color(0xffFF8D4D);
Color descriptionColor = Color(0xff6E6E6E);
ThemeData lightMode({required BuildContext context}) => ThemeData(
  scaffoldBackgroundColor: secondaryColor,
  fontFamily: "Somar",
  appBarTheme: AppBarTheme(
    backgroundColor: secondaryColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontFamily: "Somar",
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: _getTextSize(context: context, fontSize: 23),
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: primary,
    surface: backgroundColor,
    secondary: secondaryColor,
    primaryContainer: descriptionColor,
  ),
);

double _getTextSize({required BuildContext context, required double fontSize}) {
  double scalfactor = _getScaleFactor(context);

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  double responstiveTextSize = fontSize * scalfactor;
  return responstiveTextSize.clamp(lowerLimit, upperLimit);
}

double _getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
