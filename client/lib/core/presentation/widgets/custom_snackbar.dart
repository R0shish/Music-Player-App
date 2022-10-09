import 'package:flutter/material.dart';
import 'package:music_player/constants/constants.dart';

class CustomSnackBars {
  static void showErrorSnackBar(BuildContext context, String message,
      {Color color = Colors.red, IconData icon = Icons.error}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: AppColor.black,
        dismissDirection: DismissDirection.none,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(
              width: deviceWidth * 0.01,
            ),
            Text(
              message,
              style: TextStyle(color: color),
            )
          ],
        ),
      ));
  }
}
