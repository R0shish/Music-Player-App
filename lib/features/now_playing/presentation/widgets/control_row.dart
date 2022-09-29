import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/data/datasource/playlist_data.dart';
import '../../../../core/data/model/playlist_model.dart';
import '../../../../core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';
import '../../../../core/presentation/widgets/play_pause.dart';
import '../cubit/now_playing_cubit.dart';

import '../../../../constants/color_constant.dart';

class ControlRow extends StatelessWidget {
  const ControlRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        Playlist playlist = Playlist.fromJson(
          playlistData['data'][state.playlistIndex!],
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _iconButtonBuilder(context,
                onPressed: () {}, iconData: Icons.shuffle),
            _iconButtonBuilder(context,
                onPressed: () =>
                    context.read<PlayPauseCubit>().playPrev(context, playlist),
                iconData: Icons.skip_previous),
            PlayPauseButton(
              color: AppColor.primary,
              url: state.song!.url,
            ),
            _iconButtonBuilder(context,
                onPressed: () =>
                    context.read<PlayPauseCubit>().playNext(context, playlist),
                iconData: Icons.skip_next),
            _iconButtonBuilder(context,
                iconData: Icons.repeat, onPressed: () {}),
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
}) {
  return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      icon: Icon(iconData, color: AppColor.lightGrey));
}
