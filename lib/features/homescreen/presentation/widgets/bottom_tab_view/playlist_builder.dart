import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';

import '../../../../../constants/dimensions.dart';
import '../../../../../core/data/model/playlist_model.dart';
import '../../../../../core/data/model/song_model.dart';
import '../../../../../core/presentation/widgets/playlist_container.dart';
import '../../../../now_playing/presentation/cubit/now_playing_cubit.dart';

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
          int noOfSongs = playlist.songs.length;
          return PlaylistContainer(
              title: playlist.title,
              subTitle: '$noOfSongs Song${noOfSongs > 1 ? 's' : ''}',
              albumArt: playlist.image,
              backgroundImage: null,
              onPlayTap: () {
                context.read<NowPlayingCubit>().updateSong(
                    song: Song(
                        name: playlist.songs.first.name,
                        artist: playlist.songs.first.artist,
                        albumArt: playlist.songs.first.albumArt,
                        duration: playlist.songs.first.duration,
                        url: playlist.songs.first.url),
                    songIndex: 0);
                context.read<PlayPauseCubit>().play(playlist.songs.first.url);
              });
        }),
      ),
    );
  }
}
