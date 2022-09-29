import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/core/data/model/playlist_model.dart';

import '../../../../../features/now_playing/presentation/cubit/now_playing_cubit.dart';
import '../../../../data/datasource/playlist_data.dart';

part 'play_pause_state.dart';

class PlayPauseCubit extends Cubit<PlayPauseState> {
  PlayPauseCubit()
      : super(const PlayPauseState(
            duration: Duration.zero,
            position: Duration.zero,
            isPlaying: false));

  final AudioPlayer audioPlayer = AudioPlayer();

  void play(
      {required NowPlayingCubit nowPlayingCubit, required String url}) async {
    emit(state.copyWith(isPlaying: true));
    await audioPlayer.play(UrlSource(url));
    await audioPlayer.getDuration().then((value) {
      updateTotalDuration(Duration(milliseconds: value!.inMilliseconds));
    });
    audioPlayer.onPlayerComplete.listen((event) {
      playNext(nowPlayingCubit);
    });
    audioPlayer.setReleaseMode(ReleaseMode.stop);
  }

  void pause() async {
    emit(state.copyWith(isPlaying: false));
    await audioPlayer.pause();
  }

  void playPauseButtonPress(
      {required NowPlayingCubit nowPlayingCubit,
      required Playlist playlist,
      required String url}) {
    if (state.isPlaying) {
      pause();
    } else {
      play(nowPlayingCubit: nowPlayingCubit, url: url);
    }
  }

  void playNext(NowPlayingCubit nowPlayingCubit) {
    Playlist playlist = Playlist.fromJson(
      playlistData['data'][nowPlayingCubit.playlistIndex],
    );
    int nextSongIndex = (nowPlayingCubit.songIndex + 1) % playlist.songs.length;

    nowPlayingCubit.updateSong(
        song: playlist.songs[nextSongIndex],
        songIndex: nextSongIndex,
        playlistIndex: nowPlayingCubit.playlistIndex);

    play(
        nowPlayingCubit: nowPlayingCubit,
        url: playlist.songs[nextSongIndex].url);
  }

  void playPrev(NowPlayingCubit nowPlayingCubit) {
    Playlist playlist = Playlist.fromJson(
      playlistData['data'][nowPlayingCubit.playlistIndex],
    );
    int prevSongIndex = (nowPlayingCubit.songIndex - 1) % playlist.songs.length;

    nowPlayingCubit.updateSong(
        song: playlist.songs[prevSongIndex],
        songIndex: prevSongIndex,
        playlistIndex: nowPlayingCubit.playlistIndex);

    play(
        nowPlayingCubit: nowPlayingCubit,
        url: playlist.songs[prevSongIndex].url);
  }

  void updatePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void updateTotalDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }
}
