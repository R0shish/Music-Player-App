import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/color_constant.dart';

part 'repeat_state.dart';

class RepeatCubit extends Cubit<RepeatState> {
  RepeatCubit() : super(const RepeatState());

  void toggleRepeat() {
    emit(RepeatState(
        isRepeat: !state.isRepeat,
        releaseMode: state.isRepeat ? ReleaseMode.loop : ReleaseMode.stop));
  }

  void resetRepeat() {
    emit(const RepeatState(isRepeat: false, releaseMode: ReleaseMode.stop));
  }

  bool get isRepeat => state.isRepeat;

  ReleaseMode get releaseMode => state.releaseMode;

  Color get repeatIconColor => isRepeat ? AppColor.primary : AppColor.lightGrey;

  IconData get repeatIcon => isRepeat ? Icons.repeat_one : Icons.repeat;
}
