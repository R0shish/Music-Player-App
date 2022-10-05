import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/playlist_datasource.dart';
import '../../../data/model/playlist_model.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(const PlaylistLoading(playlist: []));

  late final PlaylistDataSource playlistDataSource = PlaylistDataSourceImpl();

  void getPlaylist() async {
    try {
      final playlist = await playlistDataSource.getPlaylist();
      emit(PlaylistLoaded(playlistData: playlist));
    } catch (e) {
      emit(PlaylistError(playlist: playlist, error: e.toString()));
    }
  }

  Playlist getCurrentPlaylist(index) => Playlist.fromJson(
        state.playlist[index],
      );

  List get playlist => state.playlist;
}
