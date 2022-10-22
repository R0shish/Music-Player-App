import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/core/data/model/song_model.dart';

import '../../../../constants/constants.dart';
import '../../../../services/api_handler.dart';
import '../../../data/datasource/playlist_datasource.dart';
import '../../../data/model/playlist_model.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  final Box userDataBox;
  PlaylistCubit({required this.userDataBox})
      : super(const PlaylistLoading(playlist: []));

  late final PlaylistDataSource playlistDataSource =
      SuggestedPlaylistDataSourceImpl();

  void getPlaylist() async {
    try {
      final playlist = await playlistDataSource.getPlaylist();
      emit(PlaylistLoaded(playlistData: playlist));
    } catch (e) {
      emit(PlaylistError(
          playlist: playlist,
          error: 'Please check your internet\nand try again later!'));
    }
  }

  void createPlaylist(String playlistName, String? imageUrl, Song? song) async {
    final response = await apiHandler(
      Api.createPlaylist,
      'POST',
      body: {
        'title': playlistName,
      },
      authorization: true,
      userDataBox: userDataBox,
    );
    debugPrint(response);
  }

  void deletePlaylist(String playlistId) async {
    final response = await apiHandler(
      Api.deletePlaylist,
      'DELETE',
      body: {
        'playlist_id': playlistId,
      },
      authorization: true,
      userDataBox: userDataBox,
    );
    debugPrint(response);
  }

  Playlist getCurrentPlaylist(index) => Playlist.fromJson(
        state.playlist[index],
      );

  List get playlist => state.playlist;
}
