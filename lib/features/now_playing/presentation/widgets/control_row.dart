import 'package:flutter/material.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/dimensions.dart';

class ControlRow extends StatelessWidget {
  const ControlRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _iconButtonBuilder(context, onPressed: () {}, iconData: Icons.shuffle),
        _iconButtonBuilder(context,
            onPressed: () {}, iconData: Icons.skip_previous),
        Container(
          width: deviceWidth * 0.13,
          height: deviceHeight * 0.06,
          decoration: const BoxDecoration(
              color: AppColor.lightBlack, shape: BoxShape.circle),
          child: _iconButtonBuilder(context,
              onPressed: () {},
              iconData: Icons.play_arrow,
              iconColor: AppColor.primary,
              iconSize: 35),
        ),
        _iconButtonBuilder(context,
            onPressed: () {}, iconData: Icons.skip_next),
        _iconButtonBuilder(context, iconData: Icons.repeat, onPressed: () {}),
      ],
    );
  }
}

IconButton _iconButtonBuilder(
  BuildContext context, {
  required VoidCallback onPressed,
  required IconData iconData,
  double iconSize = 25,
  Color iconColor = AppColor.lightGrey,
}) {
  return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      icon: Icon(iconData, color: iconColor));
}
