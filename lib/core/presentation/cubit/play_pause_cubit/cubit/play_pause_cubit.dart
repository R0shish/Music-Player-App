import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../features/now_playing/presentation/cubit/now_playing_cubit.dart';

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
    await audioPlayer.getDuration().then((value) {
      updateTotalDuration(Duration(milliseconds: value!.inMilliseconds));
    });
    audioPlayer.onPlayerComplete.listen((event) {
      emit(state.copyWith(isPlaying: false));
    });
    audioPlayer.setReleaseMode(ReleaseMode.stop);
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

  void playNext(BuildContext context, playlist) {
    final nowPlayingCubit = context.read<NowPlayingCubit>();
    int nextSongIndex =
        (nowPlayingCubit.songIndex + 1) % playlist.songs.length as int;

    nowPlayingCubit.updateSong(
        song: playlist.songs[nextSongIndex],
        songIndex: nextSongIndex,
        playlistIndex: nowPlayingCubit.playlistIndex);

    play(playlist.songs[nextSongIndex].url);
  }

  void playPrev(BuildContext context, playlist) {
    final nowPlayingCubit = context.read<NowPlayingCubit>();
    int prevSongIndex =
        (nowPlayingCubit.songIndex - 1) % playlist.songs.length as int;

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
}
