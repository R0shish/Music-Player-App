import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/dimensions.dart';
import '../../../features/now_playing/presentation/cubit/now_playing_cubit.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LinearPercentIndicator(
          lineHeight: 10,
          percent: 0.5,
          progressColor: AppColor.primary,
          backgroundColor: AppColor.secondary,
          barRadius: const Radius.circular(10),
        ),
        SizedBox(height: deviceHeight * 0.01),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('1:50'),
                BlocBuilder<NowPlayingCubit, NowPlayingState>(
                  builder: (context, state) {
                    return Text(state.song!.duration);
                  },
                ),
              ],
            )),
      ],
    );
  }
}
