import 'package:flutter/material.dart';

import '../../../constants/color_constant.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final IconData iconData;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.iconData,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder underlineInputBorder() {
      return const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGrey));
    }

    TextStyle textStyle({double fontSize = 12}) =>
        TextStyle(color: AppColor.lightGrey, fontSize: fontSize);

    return TextFormField(
      style: textStyle(fontSize: 16),
      decoration: InputDecoration(
          enabledBorder: underlineInputBorder(),
          focusedBorder: underlineInputBorder(),
          labelText: labelText,
          labelStyle: textStyle(),
          hintText: hintText,
          hintStyle: textStyle(fontSize: 12),
          prefixIcon: Icon(
            iconData,
            color: AppColor.lightGrey,
          )),
      obscureText: obscureText,
    );
  }
}
