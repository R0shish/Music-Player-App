import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/color_constant.dart';
import 'package:music_player/core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';

part 'repeat_state.dart';

class RepeatCubit extends Cubit<RepeatState> {
  final PlayPauseCubit playPauseCubit;
  RepeatCubit({required this.playPauseCubit})
      : super(const RepeatState(isRepeat: false));

  void toggleRepeat() {
    emit(RepeatState(isRepeat: !state.isRepeat));
    playPauseCubit.audioPlayer
        .setReleaseMode(state.isRepeat ? ReleaseMode.loop : ReleaseMode.stop);
  }

  void resetRepeat() {
    emit(const RepeatState(isRepeat: false));
  }

  Color get repeatIconColor =>
      state.isRepeat ? AppColor.primary : AppColor.lightGrey;

  IconData get repeatIcon => state.isRepeat ? Icons.repeat_one : Icons.repeat;
}
