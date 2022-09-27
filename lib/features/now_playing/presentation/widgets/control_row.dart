import 'package:flutter/material.dart';
import 'package:music_player/core/presentation/widgets/play_pause.dart';

import '../../../../constants/color_constant.dart';

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
        const PlayPauseButton(color: AppColor.primary),
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
}) {
  return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      icon: Icon(iconData, color: AppColor.lightGrey));
}
