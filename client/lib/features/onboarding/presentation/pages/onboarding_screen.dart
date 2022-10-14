import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:music_player/constants/constants.dart';
import 'package:music_player/features/onboarding/presentation/cubit/onboarding_cubit.dart';

import '../widgets/widgets.dart';

class OnboardingScreen extends StatelessWidget {
  final Box settingBox;
  const OnboardingScreen({super.key, required this.settingBox});

  @override
  Widget build(BuildContext context) {
    final LiquidController controller = LiquidController();
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) => OnboardingCubit(settingBox: settingBox),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final OnboardingCubit cubit = context.read<OnboardingCubit>();
            return Stack(alignment: Alignment.topCenter, children: [
              LiquidSwipe(
                  liquidController: controller,
                  enableLoop: false,
                  ignoreUserGestureWhileAnimating: true,
                  onPageChangeCallback: (page) => cubit.currentPage = page,
                  pages: onboardingPage(
                      context: context, onboardingData: cubit.onboardingData)),
              TopTextButton(cubit: cubit, state: state),
              BottomIndicator(controller: controller, cubit: cubit),
              NextButton(controller: controller, cubit: cubit, state: state)
            ]);
          },
        ),
      ),
    );
  }
}
