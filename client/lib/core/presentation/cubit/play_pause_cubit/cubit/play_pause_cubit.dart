import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/presentation/cubit/playlist_cubit/playlist_cubit.dart';
import 'package:music_player/features/now_playing/presentation/cubit/repeat_cubit/repeat_cubit.dart';
import '../../../../../features/now_playing/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import '../../../../data/model/playlist_model.dart';

import '../../../../data/model/song_model.dart';

part 'play_pause_state.dart';

class PlayPauseCubit extends Cubit<PlayPauseState> {
  final NowPlayingCubit nowPlayingCubit;
  final RepeatCubit repeatCubit;
  final PlaylistCubit playlistCubit;

  PlayPauseCubit({
    required this.nowPlayingCubit,
    required this.repeatCubit,
    required this.playlistCubit,
  }) : super(const PlayPauseState(
            duration: Duration.zero,
            position: Duration.zero,
            isPlaying: false));

  final AudioPlayer audioPlayer = AudioPlayer();

  void play(String url) async {
    emit(state.copyWith(
        isPlaying: true, position: Duration.zero, duration: Duration.zero));

    await audioPlayer.play(UrlSource(url));

    audioPlayer.onPlayerComplete.listen((event) {
      if (repeatCubit.state.isRepeat) {
        play(url);
      } else {
        playNext();
      }
    });
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

  void playNext() {
    audioPlayer.stop();
    Playlist playlist = Playlist.fromJson(
      playlistCubit.playlist[nowPlayingCubit.playlistIndex],
    );
    int nextSongIndex = (nowPlayingCubit.songIndex + 1) % playlist.songs.length;

    nowPlayingCubit.updateSong(
        song: playlist.songs[nextSongIndex],
        songIndex: nextSongIndex,
        playlistIndex: nowPlayingCubit.playlistIndex);

    play(playlist.songs[nextSongIndex].url);
  }

  void playPrev() {
    audioPlayer.stop();
    Playlist playlist = Playlist.fromJson(
      playlistCubit.playlist[nowPlayingCubit.playlistIndex],
    );
    int prevSongIndex = (nowPlayingCubit.songIndex - 1) % playlist.songs.length;

    nowPlayingCubit.updateSong(
        song: playlist.songs[prevSongIndex],
        songIndex: prevSongIndex,
        playlistIndex: nowPlayingCubit.playlistIndex);

    play(playlist.songs[prevSongIndex].url);
  }

  void updatePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void updateTotalDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  bool get isPlaying => state.isPlaying;
  Song get currentSong => nowPlayingCubit.song;
}
