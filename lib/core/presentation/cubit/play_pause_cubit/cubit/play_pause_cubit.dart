import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'play_pause_state.dart';

class PlayPauseCubit extends Cubit<PlayPauseState> {
  PlayPauseCubit() : super(const PausedState());

  final AudioPlayer audioPlayer = AudioPlayer();

  void play(String url) async {
    await audioPlayer.play(UrlSource(url));
    emit(const PlayingState());
  }

  void pause() async {
    await audioPlayer.pause();
    emit(const PausedState());
  }

  void playPauseButtonPress(String url) {
    if (state is PlayingState) {
      pause();
    } else {
      play(url);
    }
  }
}
