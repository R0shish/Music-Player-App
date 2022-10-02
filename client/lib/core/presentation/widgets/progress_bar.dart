import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/play_pause_cubit/cubit/play_pause_cubit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/dimensions.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  void initState() {
    super.initState();
    PlayPauseCubit cubit = context.read<PlayPauseCubit>();
    cubit.audioPlayer.onPositionChanged.listen((Duration currentPosition) {
      cubit.updatePosition(currentPosition);
    });
    cubit.audioPlayer.onDurationChanged.listen((Duration totalDuration) {
      cubit.updateTotalDuration(totalDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<PlayPauseCubit, PlayPauseState>(
          builder: (context, state) {
            return LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              animateFromLastPercent: true,
              curve: Curves.easeInOut,
              lineHeight: 10,
              percent: state.duration == Duration.zero
                  ? state.position.inSeconds / 1
                  : state.position.inSeconds / state.duration.inSeconds,
              progressColor: AppColor.primary,
              backgroundColor: AppColor.secondary,
              barRadius: const Radius.circular(10),
            );
          },
        ),
        SizedBox(height: deviceHeight * 0.01),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<PlayPauseCubit, PlayPauseState>(
                    builder: (context, state) {
                  return Text(state.position.toString().substring(2, 7));
                }),
                BlocBuilder<PlayPauseCubit, PlayPauseState>(
                  builder: (context, state) {
                    return Text(state.duration.toString().substring(2, 7));
                  },
                ),
              ],
            )),
      ],
    );
  }
}
