import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/play_pause_cubit/cubit/play_pause_cubit.dart';

import '../../../constants/constants.dart';

class PlayPauseButton extends StatelessWidget {
  final Color color;
  final double size;
  final String url;
  const PlayPauseButton({
    Key? key,
    this.color = AppColor.secondary,
    this.size = 32,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      width: deviceWidth * 0.15,
      height: deviceHeight * 0.05,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColor.grey),
      ),
      child: BlocBuilder<PlayPauseCubit, PlayPauseState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () =>
                context.read<PlayPauseCubit>().playPauseButtonPress(url),
            child: Icon(
              state.isPlaying ? Icons.pause : Icons.play_arrow,
              color: color,
              size: size,
            ),
          );
        },
      ),
    );
  }
}
