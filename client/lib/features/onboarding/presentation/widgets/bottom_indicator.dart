import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../constants/constants.dart';
import '../cubit/onboarding_cubit.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({
    Key? key,
    required this.controller,
    required this.cubit,
  }) : super(key: key);

  final LiquidController controller;
  final OnboardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: deviceHeight * 0.05,
      child: AnimatedSmoothIndicator(
          effect: ExpandingDotsEffect(
              dotHeight: deviceHeight * 0.02,
              dotWidth: deviceWidth * 0.04,
              activeDotColor: AppColor.primary,
              dotColor: AppColor.lightGrey),
          onDotClicked: (index) => controller.animateToPage(page: index),
          activeIndex: cubit.currentPage,
          count: cubit.onboardingData.length),
    );
  }
}
