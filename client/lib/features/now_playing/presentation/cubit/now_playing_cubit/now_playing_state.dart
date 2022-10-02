part of 'now_playing_cubit.dart';

class NowPlayingState extends Equatable {
  final Song? song;
  final int? songIndex;
  final int? playlistIndex;
  const NowPlayingState({this.song, this.songIndex, this.playlistIndex});

  NowPlayingState copyWith({
    Song? song,
    int? songIndex,
    int? playlistIndex,
  }) {
    return NowPlayingState(
      song: song ?? this.song,
      songIndex: songIndex ?? this.songIndex,
      playlistIndex: playlistIndex ?? this.playlistIndex,
    );
  }

  @override
  List<Object?> get props => [song];
}
