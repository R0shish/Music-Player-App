import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';

import '../../../constants/color_constant.dart';
import '../../../constants/dimensions.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();

    return BlocProvider(
      create: (context) => PlayPauseCubit(),
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        width: deviceWidth * 0.15,
        height: deviceHeight * 0.05,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.grey),
        ),
        child: BlocBuilder<PlayPauseCubit, PlayPauseState>(
          builder: (context, state) {
            PlayPauseCubit cubit = context.read<PlayPauseCubit>();
            return GestureDetector(
              onTap: () async {
                if (state is PlayingState) {
                  cubit.pause();
                  await audioPlayer.pause();
                } else {
                  cubit.play();
                  await audioPlayer.play(UrlSource(
                      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'));
                }
              },
              child: state is PlayingState
                  ? const Icon(
                      Icons.pause,
                      color: AppColor.secondary,
                      size: 32,
                    )
                  : const Icon(
                      Icons.play_arrow,
                      color: AppColor.secondary,
                      size: 32,
                    ),
            );
          },
        ),
      ),
    );
  }
}
