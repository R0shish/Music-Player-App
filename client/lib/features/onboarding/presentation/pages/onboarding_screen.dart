import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/constants.dart';
import 'package:music_player/core/presentation/widgets/widgets.dart';
import 'package:music_player/features/onboarding/presentation/cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    late OnboardingCubit cubit;
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                cubit = context.read<OnboardingCubit>();
                return TextButton(
                    onPressed: () => cubit.endOnboarding(context),
                    child: Padding(
                      padding: EdgeInsets.all(deviceWidth * 0.05),
                      child: Text(state.isLastPage ? 'Get Started' : 'Skip',
                          style: Theme.of(context).textTheme.headline2),
                    ));
              },
            ),
            BlocBuilder<OnboardingCubit, OnboardingState>(
                builder: (context, state) =>
                    cubit.onboardingImages[state.currentPage]),
            Padding(
              padding: EdgeInsets.only(
                  left: deviceWidth * 0.05,
                  right: deviceWidth * 0.05,
                  bottom: deviceHeight * 0.12,
                  top: deviceHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<OnboardingCubit, OnboardingState>(
                    builder: (context, state) {
                      return TextTitle(
                        text: cubit.onboardingTitles[state.currentPage],
                        fontSize: 40,
                        height: 1.1,
                      );
                    },
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.75,
                        child: BlocBuilder<OnboardingCubit, OnboardingState>(
                          builder: (context, state) {
                            return TextTitle(
                              text: cubit
                                  .onboardingDescriptions[state.currentPage],
                              fontSize: 16,
                              color: Colors.grey,
                              height: 1.7,
                            );
                          },
                        ),
                      ),
                      Container(
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
                          onPressed: () => cubit.nextPage(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
