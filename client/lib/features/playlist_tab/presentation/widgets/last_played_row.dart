import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';

import '../../../../constants/constants.dart';
import '../../../now_playing/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import '../../../now_playing/presentation/widgets/album_art_container.dart';

class LastPlayedRow extends StatelessWidget {
  const LastPlayedRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Last Played', style: Theme.of(context).textTheme.headline1),
        SizedBox(height: deviceHeight * 0.02),
        BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
            if (state.song != null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AlbumArtContainer(
                    height: deviceHeight * 0.1,
                    width: deviceWidth * 0.22,
                  ),
                  SizedBox(width: deviceWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.song!.name,
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          state.song!.artist,
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<PlayPauseCubit, PlayPauseState>(
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            final PlayPauseCubit playPauseCubit =
                                context.read<PlayPauseCubit>();

                            playPauseCubit.playPauseButtonPress(
                                playPauseCubit.currentSong.url);
                          },
                          icon: state.isPlaying
                              ? const Icon(
                                  Icons.pause,
                                  color: AppColor.secondary,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  color: AppColor.secondary,
                                ));
                    },
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppColor.secondary,
                      ))
                ],
              );
            } else {
              return Text(
                'No Songs Played Yet',
                style: Theme.of(context).textTheme.bodyText1,
              );
            }
          },
        ),
      ],
    );
  }
}
