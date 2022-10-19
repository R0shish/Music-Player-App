import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import 'widgets.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;

  const CustomRoundedButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: AppColor.grey)),
      ),
      onPressed: () => onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
        child: TextTitle(
          text: text,
          color: AppColor.primary,
          fontSize: 16,
        ),
      ),
    );
  }
}
