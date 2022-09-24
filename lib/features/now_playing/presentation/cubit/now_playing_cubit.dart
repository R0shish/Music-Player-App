import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/model/song_model.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(const NowPlayingState());

  void updateSong(Song song) {
    emit(NowPlayingState(song: song));
  }
}
