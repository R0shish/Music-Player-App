import 'package:cached_network_image/cached_network_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/model/song_model.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(const NowPlayingState());

  void updateSong(
      {required Song song,
      required int songIndex,
      required int playlistIndex}) {
    emit(state.copyWith(
        song: song, songIndex: songIndex, playlistIndex: playlistIndex));
  }

  CachedNetworkImageProvider get songImage =>
      CachedNetworkImageProvider(state.song!.albumArt);

  bool isCurrentSongPlaying({required int songIndex, required playlistIndex}) =>
      state.songIndex == songIndex && state.playlistIndex == playlistIndex;

  int get songIndex => state.songIndex!;
  int get playlistIndex => state.playlistIndex!;
}
