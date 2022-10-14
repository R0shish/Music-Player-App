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
        backgroundColor: showConfetti ? Colors.transparent : AppColor.black,
        padding: EdgeInsets.zero,
        dismissDirection: DismissDirection.none,
        content: showConfetti
            ? Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Lottie.asset('assets/lottie/confetti.json',
                        fit: BoxFit.fill, repeat: false),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
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
            : Padding(
                padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.015),
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
