import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/features/onboarding/data/model/onboarding_model.dart';

import '../../data/datasource/onboarding_data.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final Box settingBox;
  OnboardingCubit({required this.settingBox}) : super(const OnboardingState());

  List<Onboarding> get onboardingData => onboardingPageData;

  void endOnboarding(BuildContext context) async {
    settingBox.put('firstTimeInit', false);
    Navigator.pushReplacementNamed(context, '/home');
  }

  set currentPage(int value) {
    emit(state.copyWith(currentPage: value));
    if (value == onboardingData.length - 1) {
      emit(state.copyWith(isLastPage: true));
    } else {
      emit(state.copyWith(isLastPage: false));
    }
  }

  int get currentPage => state.currentPage;
  bool get isLastPage => state.isLastPage;
}
