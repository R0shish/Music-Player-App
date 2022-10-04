import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/constants/color_constant.dart';

part 'repeat_state.dart';

class RepeatCubit extends Cubit<RepeatState> {
  final AudioPlayer audioPlayer;
  RepeatCubit({required this.audioPlayer})
      : super(const RepeatState(isRepeat: false));

  void toggleRepeat() {
    emit(RepeatState(isRepeat: !state.isRepeat));
    audioPlayer.setLoopMode(state.isRepeat ? LoopMode.one : LoopMode.all);
  }

  void resetRepeat() {
    emit(const RepeatState(isRepeat: false));
    audioPlayer.setLoopMode(LoopMode.all);
  }

  Color get repeatIconColor =>
      state.isRepeat ? AppColor.primary : AppColor.lightGrey;

  IconData get repeatIcon => state.isRepeat ? Icons.repeat_one : Icons.repeat;
}
