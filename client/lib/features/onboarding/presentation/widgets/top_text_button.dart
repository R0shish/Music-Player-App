import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../cubit/onboarding_cubit.dart';

class TopTextButton extends StatelessWidget {
  const TopTextButton({
    Key? key,
    required this.cubit,
    required this.state,
  }) : super(key: key);

  final OnboardingCubit cubit;
  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: deviceHeight * 0.04,
      right: deviceWidth * 0.01,
      child: TextButton(
          onPressed: () => cubit.endOnboarding(context),
          child: Padding(
            padding: EdgeInsets.all(deviceWidth * 0.05),
            child: Text(state.isLastPage ? 'Get Started' : 'Skip',
                style: Theme.of(context).textTheme.headline2),
          )),
    );
  }
}
