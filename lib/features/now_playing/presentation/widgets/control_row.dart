import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/now_playing/presentation/cubit/repeat_cubit/repeat_cubit.dart';

import '../../../../constants/color_constant.dart';
import '../../../../core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';
import '../../../../core/presentation/widgets/play_pause.dart';
import '../cubit/now_playing_cubit/now_playing_cubit.dart';

class ControlRow extends StatelessWidget {
  const ControlRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayPauseCubit playPauseCubit = context.read<PlayPauseCubit>();
    final NowPlayingCubit nowPlayingCubit = context.read<NowPlayingCubit>();
    final RepeatCubit repeatCubit = context.read<RepeatCubit>();

    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (_, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _iconButtonBuilder(context,
                onPressed: () {}, iconData: Icons.shuffle),
            _iconButtonBuilder(context, onPressed: () {
              repeatCubit.resetRepeat();
              playPauseCubit.playPrev(nowPlayingCubit);
            }, iconData: Icons.skip_previous),
            PlayPauseButton(
              color: AppColor.primary,
              url: state.song!.url,
            ),
            _iconButtonBuilder(context, onPressed: () {
              repeatCubit.resetRepeat();
              playPauseCubit.playNext(nowPlayingCubit);
            }, iconData: Icons.skip_next),
            _iconButtonBuilder(context,
                iconData: context.watch<RepeatCubit>().repeatIcon,
                iconColor: context.watch<RepeatCubit>().repeatIconColor,
                onPressed: () {
              context.read<RepeatCubit>().toggleRepeat();
            }),
          ],
        );
      },
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
