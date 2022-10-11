import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

ButtonStyle buttonStyle() => ElevatedButton.styleFrom(
      fixedSize: Size(deviceWidth * 0.9, deviceHeight * 0.06),
      backgroundColor: AppColor.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
