import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
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
  final AudioPlayer audioPlayer;

  PlayPauseCubit({
    required this.nowPlayingCubit,
    required this.repeatCubit,
    required this.playlistCubit,
    required this.audioPlayer,
  }) : super(const PlayPauseState(
            duration: Duration.zero,
            position: Duration.zero,
            isPlaying: false));

  void play(String url) async {
    Playlist playlist =
        playlistCubit.getCurrentPlaylist(nowPlayingCubit.playlistIndex);

    emit(state.copyWith(
        isPlaying: true, position: Duration.zero, duration: Duration.zero));

    List<AudioSource> audioSources = playlist.songs
        .map((Song song) => AudioSource.uri(Uri.parse(song.url)))
        .toList();

    ConcatenatingAudioSource playlistSource = ConcatenatingAudioSource(
        useLazyPreparation: false, children: audioSources);

    audioPlayer.setAudioSource(playlistSource,
        initialIndex: nowPlayingCubit.songIndex);

    await audioPlayer.play();

    audioPlayer.currentIndexStream.listen((index) {
      nowPlayingCubit.updateSong(
          song: playlist.songs[index!],
          songIndex: index,
          playlistIndex: nowPlayingCubit.playlistIndex);
    });
  }

  void pause() async {
    emit(state.copyWith(isPlaying: false));
    await audioPlayer.pause();
  }

  void resume() async {
    emit(state.copyWith(isPlaying: true));
    await audioPlayer.play();
  }

  void playPauseButtonPress(String url) {
    if (state.isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  void playNext() {
    audioPlayer.seekToNext();
  }

  void playPrev() {
    audioPlayer.seekToPrevious();
  }

  void updatePosition(Duration position) {
    emit(state.copyWith(position: position));
  }

  void updateTotalDuration(Duration? duration) {
    emit(state.copyWith(duration: duration));
  }

  bool get isPlaying => state.isPlaying;
  Song get currentSong => nowPlayingCubit.song;
}
