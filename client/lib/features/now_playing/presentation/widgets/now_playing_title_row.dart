import 'package:flutter/material.dart';

import '../../../../constants/color_constant.dart';
import '../../../../constants/dimensions.dart';
import '../../../../core/presentation/widgets/title_style_text.dart';

class NowPlayingTitleRow extends StatelessWidget {
  const NowPlayingTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: deviceHeight * 0.02),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 35,
            ),
          ),
          const Expanded(
            child: TitleStyleText(
              text1: 'Now',
              color1: AppColor.secondary,
              text2: 'Playing',
              color2: AppColor.primary,
              textAlign: TextAlign.center,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 35,
          ),
        ],
      ),
    );
  }
}
