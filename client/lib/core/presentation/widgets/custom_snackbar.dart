import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_player/constants/constants.dart';

class CustomSnackBars {
  static void showErrorSnackBar(BuildContext context, String message,
      {Color color = Colors.red}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: AppColor.black,
        dismissDirection: DismissDirection.none,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/lottie/error.json',
                height: deviceHeight * 0.032, repeat: false),
            SizedBox(width: deviceWidth * 0.01),
            Text(
              message,
              style: TextStyle(color: color),
            )
          ],
        ),
      ));
  }

  static void showSuccessSnackBar(
    BuildContext context,
    String message, {
    Color color = Colors.green,
    IconData icon = Icons.check,
    bool showConfetti = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.none,
        content: showConfetti
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Lottie.asset('assets/lottie/confetti.json',
                      height: deviceHeight * 0.9,
                      fit: BoxFit.fill,
                      repeat: false),
                  Container(
                    color: AppColor.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(icon, color: color),
                        SizedBox(width: deviceWidth * 0.01),
                        Text(message, style: TextStyle(color: color))
                      ],
                    ),
                  ),
                ],
              )
            : Container(
                color: AppColor.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icon, color: color),
                    SizedBox(width: deviceWidth * 0.01),
                    Text(message, style: TextStyle(color: color))
                  ],
                ),
              ),
      ));
  }
}
