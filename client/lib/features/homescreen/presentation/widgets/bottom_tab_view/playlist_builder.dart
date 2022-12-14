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
  final bool isGrid;
  const PlaylistBuilder(
      {Key? key, required this.playlistData, this.isGrid = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isGrid ? null : deviceHeight * 0.25,
      child: isGrid
          ? GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlistData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
              ),
              itemBuilder: ((context, index) {
                Playlist playlist = (playlistData[index] is Playlist)
                    ? playlistData[index]
                    : Playlist.fromJson(
                        playlistData[index],
                      );
                int noOfSongs = playlist.songs.length;
                return _Container(
                    playlist: playlist,
                    noOfSongs: noOfSongs,
                    index: index,
                    isGrid: isGrid);
              }),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: playlistData.length,
              itemBuilder: ((context, index) {
                Playlist playlist = (playlistData[index] is Playlist)
                    ? playlistData[index]
                    : Playlist.fromJson(
                        playlistData[index],
                      );
                int noOfSongs = playlist.songs.length;
                return _Container(
                    playlist: playlist,
                    noOfSongs: noOfSongs,
                    index: index,
                    isGrid: isGrid);
              }),
            ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({
    Key? key,
    required this.playlist,
    required this.noOfSongs,
    required this.index,
    required this.isGrid,
  }) : super(key: key);

  final Playlist playlist;
  final int noOfSongs;
  final int index;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
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
            marginRight: isGrid ? 0 : 16,
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
              context.read<PlayPauseCubit>().play(playlist.songs.first.url);
            }));
  }
}
