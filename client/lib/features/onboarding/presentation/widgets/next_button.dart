import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../../constants/constants.dart';
import '../cubit/onboarding_cubit.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    required this.controller,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final LiquidController controller;
  final OnboardingCubit cubit;
  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: deviceHeight * 0.12,
        right: deviceWidth * 0.08,
        child: Container(
          height: deviceHeight * 0.1,
          width: deviceWidth * 0.1,
          decoration: const BoxDecoration(
              color: AppColor.primary, shape: BoxShape.circle),
          child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: AppColor.black,
                size: 20,
              ),
              onPressed: () => !state.isLastPage
                  ? controller.animateToPage(
                      page: controller.currentPage + 1, duration: 400)
                  : cubit.endOnboarding(context)),
        ));
  }
}
