part of 'play_pause_cubit.dart';

abstract class PlayPauseState extends Equatable {
  const PlayPauseState();

  @override
  List<Object> get props => [];
}

class PlayingState extends PlayPauseState {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  const PlayingState({
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.isPlaying = true,
  });
}

class PausedState extends PlayPauseState {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  const PausedState({
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.isPlaying = false,
  });
}
