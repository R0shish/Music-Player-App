import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'play_pause_state.dart';

class PlayPauseCubit extends Cubit<PlayPauseState> {
  PlayPauseCubit()
      : super(const PlayPauseState(
            duration: Duration.zero,
            position: Duration.zero,
            isPlaying: false));

  final AudioPlayer audioPlayer = AudioPlayer();

  void play(String url) async {
    emit(state.copyWith(isPlaying: true));
    await audioPlayer.play(UrlSource(url));
  }

  void pause() async {
    emit(state.copyWith(isPlaying: false));
    await audioPlayer.pause();
  }

  void playPauseButtonPress(String url) {
    if (state.isPlaying) {
      pause();
    } else {
      play(url);
    }
  }

  void updatePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void updateTotalDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }
}
