part of 'now_playing_cubit.dart';

class NowPlayingState extends Equatable {
  final Song? song;
  final int? songIndex;
  const NowPlayingState({this.song, this.songIndex});

  @override
  List<Object?> get props => [song];
}
