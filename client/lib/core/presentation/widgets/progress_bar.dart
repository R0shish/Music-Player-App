import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../constants/constants.dart';

class ProgressBar extends StatefulWidget {
  final bool isHomescreen;
  const ProgressBar({
    Key? key,
    this.isHomescreen = false,
  }) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  void initState() {
    super.initState();
    PlayPauseCubit cubit = context.read<PlayPauseCubit>();

    cubit.audioPlayer.positionStream.listen((Duration position) {
      cubit.updatePosition(position);
    });

    cubit.audioPlayer.durationStream.listen((Duration? duration) {
      cubit.updateTotalDuration(duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<PlayPauseCubit, PlayPauseState>(
          builder: (context, state) {
            if (widget.isHomescreen) {
              return LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                animateFromLastPercent: true,
                curve: Curves.easeInOut,
                lineHeight: 10,
                percent: state.duration == Duration.zero
                    ? 0
                    : state.position.inSeconds / state.duration.inSeconds,
                progressColor: AppColor.primary,
                backgroundColor: AppColor.secondary,
                barRadius: const Radius.circular(10),
              );
            }
            return Slider(
              value: state.position.inSeconds.toDouble(),
              min: 0,
              max: state.duration.inSeconds.toDouble(),
              activeColor: AppColor.primary,
              inactiveColor: AppColor.secondary,
              onChanged: (value) {
                context
                    .read<PlayPauseCubit>()
                    .audioPlayer
                    .seek(Duration(seconds: value.toInt()));
              },
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
