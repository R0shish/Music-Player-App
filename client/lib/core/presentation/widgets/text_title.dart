import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final TextOverflow overflow;
  final int maxLines;
  final double height;
  const TextTitle({
    Key? key,
    required this.text,
    this.color = Colors.white,
    this.fontSize = 22.0,
    this.fontWeight = FontWeight.w600,
    this.fontFamily = 'Montserrat',
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 3,
    this.height = 1,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          height: height),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
