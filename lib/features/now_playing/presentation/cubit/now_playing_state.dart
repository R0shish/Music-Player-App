part of 'now_playing_cubit.dart';

class NowPlayingState extends Equatable {
  final Song? song;
  final int? songIndex;
  final int? playlistIndex;
  const NowPlayingState({this.song, this.songIndex, this.playlistIndex});

  @override
  List<Object?> get props => [song];
}
