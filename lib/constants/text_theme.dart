import 'package:flutter/material.dart';

import 'color_constant.dart';

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 18,
      fontWeight: FontWeight.w200,
    ),
    bodyText2: TextStyle(
      color: AppColor.secondary,
      fontFamily: 'Montserrat',
      fontSize: 16,
    ),
  );
}

Text nowPlayingText({
  required String text,
  double fontSize = 20,
  FontWeight fontWeight = FontWeight.bold,
  Color? color,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'Montserrat',
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
