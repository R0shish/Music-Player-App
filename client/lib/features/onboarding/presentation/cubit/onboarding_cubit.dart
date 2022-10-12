import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState());

  List<Image> get onboardingImages => [
        Image.asset('assets/images/onboarding_1.png'),
        Image.asset('assets/images/onboarding_2.png'),
        Image.asset('assets/images/onboarding_3.png'),
      ];

  List<String> get onboardingTitles => [
        'Enjoy Your\nMusic',
        'Listen With\nNo Ads',
        'Listen to your\nfavorite music',
      ];

  List<String> get onboardingDescriptions => [
        'You can enjoy 75 million songs and thousands of exper-programmed playlists and stations.',
        'You can enjoy 75 million songs and thousands of exper-programmed playlists and stations.',
        'You can enjoy 75 million songs and thousands of exper-programmed playlists and stations.',
      ];

  void nextPage(BuildContext context) {
    if (state.currentPage == onboardingImages.length - 2) {
      emit(state.copyWith(isLastPage: true));
    }
    if (state.currentPage == onboardingImages.length - 1) {
      endOnboarding(context);
    } else {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void swipeNext(BuildContext context) =>
      !state.isLastPage ? nextPage(context) : null;

  void swipePrev(BuildContext context) =>
      state.currentPage == 0 ? null : previousPage();

  void previousPage() {
    if (state.currentPage != onboardingImages.length - 2) {
      emit(state.copyWith(isLastPage: false));
    }
    emit(state.copyWith(currentPage: state.currentPage - 1));
  }

  void endOnboarding(BuildContext context) async {
    Box settingBox = Hive.box('SETTINGS');
    settingBox.put('firstTimeInit', false);
    Navigator.pushReplacementNamed(context, '/home');
  }

  bool get isLastPage => state.isLastPage;
}
