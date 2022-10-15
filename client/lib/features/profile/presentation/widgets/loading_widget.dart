import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/searching.json', fit: BoxFit.fitWidth),
          Text(
            'Please Wait While We\nLoad Your Profile',
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
