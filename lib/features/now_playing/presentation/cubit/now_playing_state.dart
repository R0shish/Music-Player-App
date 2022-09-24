part of 'now_playing_cubit.dart';

class NowPlayingState extends Equatable {
  final Song? song;
  const NowPlayingState({this.song});

  @override
  List<Object?> get props => [song];
}
