part of 'playlist_cubit.dart';

@immutable
abstract class PlaylistState extends Equatable {
  final List<dynamic> playlist;

  const PlaylistState({required this.playlist});

  @override
  List<Object> get props => [playlist];
}

class PlaylistLoading extends PlaylistState {
  const PlaylistLoading({required super.playlist});

  @override
  List<Object> get props => [];
}

class PlaylistLoaded extends PlaylistState {
  final List<dynamic> playlistData;
  const PlaylistLoaded({required this.playlistData})
      : super(playlist: playlistData);

  @override
  List<Object> get props => [playlist];
}
