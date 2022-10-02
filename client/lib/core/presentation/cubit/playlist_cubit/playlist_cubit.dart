import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/datasource/playlist_datasource.dart';

part 'playlist_state.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(const PlaylistLoading(playlist: []));

  late final PlaylistDataSource playlistDataSource = PlaylistDataSourceImpl();

  void getPlaylist() async {
    final playlist = await playlistDataSource.getPlaylist();
    emit(PlaylistLoaded(playlistData: playlist));
  }

  List get playlist => state.playlist;
}
