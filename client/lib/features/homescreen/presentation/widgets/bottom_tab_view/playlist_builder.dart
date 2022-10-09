import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/cubit/cubit.dart';
import '../../../../songs_list/presentation/pages/songs_list.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/data/model/playlist_model.dart';
import '../../../../../core/data/model/song_model.dart';
import '../../../../../core/presentation/widgets/widgets.dart';

class PlaylistBuilder extends StatelessWidget {
  final List<dynamic> playlistData;
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
        itemCount: playlistData.length,
        itemBuilder: ((context, index) {
          Playlist playlist = Playlist.fromJson(
            playlistData[index],
          );
          int noOfSongs = playlist.songs.length;
          return GestureDetector(
              onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => BlocProvider<NowPlayingCubit>.value(
                      value: context.read<NowPlayingCubit>(),
                      child: BlocProvider<PlayPauseCubit>.value(
                        value: context.read<PlayPauseCubit>(),
                        child: SongsList(
                            playlistTitle: playlist.title,
                            playlistIndex: index,
                            songsList: playlist.songs),
                      ),
                    ),
                  ),
              child: PlaylistContainer(
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
                              url: playlist.songs.first.url),
                          songIndex: 0,
                          playlistIndex: index,
                        );
                    context
                        .read<PlayPauseCubit>()
                        .play(playlist.songs.first.url);
                  }));
        }),
      ),
    );
  }
}
