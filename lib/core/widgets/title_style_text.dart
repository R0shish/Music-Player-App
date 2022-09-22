import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

class TitleStyleText extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color1;
  final Color color2;
  final double fontSize;
  final FontWeight fontWeight;
  const TitleStyleText({
    Key? key,
    required this.text1,
    required this.text2,
    this.color1 = AppColor.primary,
    this.color2 = AppColor.secondary,
    this.fontSize = 22.0,
    this.fontWeight = FontWeight.w600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
          text: text1,
          style: TextStyle(
            color: color1,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        TextSpan(
            text: ' $text2',
            style: TextStyle(
              color: color2,
              fontSize: fontSize,
              fontWeight: fontWeight,
            )),
      ],
    ));
  }
}
