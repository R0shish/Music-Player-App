import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController? controller;
  final bool isPassword;
  const CustomTextFormField(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.iconData,
      this.controller,
      this.isPassword = false});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscurePassword = true;
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
      controller: widget.controller,
      decoration: InputDecoration(
          enabledBorder: underlineInputBorder(),
          focusedBorder: underlineInputBorder(),
          labelText: widget.labelText,
          labelStyle: textStyle(),
          hintText: widget.hintText,
          hintStyle: textStyle(fontSize: 12),
          prefixIcon: Icon(
            widget.iconData,
            color: AppColor.lightGrey,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () =>
                      setState(() => obscurePassword = !obscurePassword),
                  icon: Icon(
                    obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: AppColor.lightGrey,
                  ))
              : null),
      obscureText: widget.isPassword ? obscurePassword : false,
    );
  }
}
