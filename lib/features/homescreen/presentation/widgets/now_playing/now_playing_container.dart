import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../constants/color_constant.dart';
import '../../../../../constants/dimensions.dart';
import 'song_info_row.dart';

class NowPlayingContainer extends StatelessWidget {
  const NowPlayingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: deviceHeight * 0.03,
          left: deviceWidth * 0.03,
          right: deviceWidth * 0.03),
      height: deviceHeight / 5,
      decoration: BoxDecoration(
        color: AppColor.darkGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SongInformationRow(),
            SizedBox(height: deviceHeight * 0.02),
            LinearPercentIndicator(
              lineHeight: 10,
              percent: 0.5,
              progressColor: AppColor.primary,
              backgroundColor: AppColor.secondary,
              barRadius: const Radius.circular(10),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('1:50'),
                    Text('2:55'),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
