import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'play_pause_state.dart';

class PlayPauseCubit extends Cubit<PlayPauseState> {
  PlayPauseCubit() : super(const PausedState());

  void play() {
    emit(const PlayingState());
  }

  void pause() {
    emit(const PausedState());
  }
}
