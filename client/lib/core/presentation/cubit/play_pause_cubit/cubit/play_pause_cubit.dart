import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/now_playing/presentation/cubit/repeat_cubit/repeat_cubit.dart';
import '../../../../../features/now_playing/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import '../../../../data/model/playlist_model.dart';

import '../../../../data/datasource/playlist_data.dart';
import '../../../../data/model/song_model.dart';

part 'play_pause_state.dart';

class PlayPauseCubit extends Cubit<PlayPauseState> {
  final NowPlayingCubit nowPlayingCubit;
  final RepeatCubit repeatCubit;

  PlayPauseCubit({required this.nowPlayingCubit, required this.repeatCubit})
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
      if (repeatCubit.state.isRepeat) {
        play(url);
      } else {
        playNext(nowPlayingCubit);
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

  void playNext(NowPlayingCubit nowPlayingCubit) {
    Playlist playlist = Playlist.fromJson(
      playlistData['data'][nowPlayingCubit.playlistIndex],
    );
    int nextSongIndex = (nowPlayingCubit.songIndex + 1) % playlist.songs.length;

    nowPlayingCubit.updateSong(
        song: playlist.songs[nextSongIndex],
        songIndex: nextSongIndex,
        playlistIndex: nowPlayingCubit.playlistIndex);

    play(playlist.songs[nextSongIndex].url);
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

    play(playlist.songs[prevSongIndex].url);
  }

  void updatePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void updateTotalDuration(Duration duration) {
    emit(state.copyWith(duration: duration));
  }

  void resetRepeat() {
    emit(state.copyWith(duration: Duration.zero, position: Duration.zero));
    audioPlayer.pause();
    repeatCubit.emit(const RepeatState(isRepeat: false));
  }

  bool get isPlaying => state.isPlaying;
  Song get currentSong => nowPlayingCubit.song;
}
