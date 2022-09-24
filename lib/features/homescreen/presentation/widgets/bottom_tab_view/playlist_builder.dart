import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/now_playing/presentation/cubit/now_playing_cubit.dart';

import '../../../../../constants/dimensions.dart';
import '../../../../../core/data/model/playlist_model.dart';
import '../../../../../core/data/model/song_model.dart';
import '../../../../../core/widgets/playlist_container.dart';

class PlaylistBuilder extends StatelessWidget {
  final Map<String, dynamic> playlistData;
  const PlaylistBuilder({
    Key? key,
    required this.playlistData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight * 0.23,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: playlistData['data'].length,
        itemBuilder: ((context, index) {
          Playlist playlist = Playlist.fromJson(
            playlistData['data'][index],
          );
          return PlaylistContainer(
              title: playlist.title,
              subTitle: playlist.subTitle,
              image: playlist.image,
              onPlayTap: () => context.read<NowPlayingCubit>().updateSong(Song(
                    name: playlist.title,
                    artist: playlist.subTitle,
                    albumArt: playlist.image,
                    duration: '3:00',
                  )));
        }),
      ),
    );
  }
}
