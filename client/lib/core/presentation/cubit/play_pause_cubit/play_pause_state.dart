part of 'play_pause_cubit.dart';

class PlayPauseState extends Equatable {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  const PlayPauseState({
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.isPlaying = false,
  });

  PlayPauseState copyWith({
    Duration? position,
    Duration? duration,
    bool? isPlaying,
  }) {
    return PlayPauseState(
      position: position ?? this.position,
      duration: duration ?? this.duration,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object> get props => [position, duration, isPlaying];
}
