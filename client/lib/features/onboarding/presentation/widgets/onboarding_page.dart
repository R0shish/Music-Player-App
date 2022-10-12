import 'package:flutter/material.dart';
import 'package:music_player/features/onboarding/data/model/onboarding_model.dart';

import '../../../../constants/constants.dart';
import '../../../../core/presentation/widgets/widgets.dart';

List<Scaffold> onboardingPage({
  required BuildContext context,
  required List<Onboarding> onboardingData,
}) {
  return [
    for (int i = 0; i < onboardingData.length; i++)
      Scaffold(
        backgroundColor: onboardingData[i].color,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            onboardingData[i].image,
            Padding(
              padding: EdgeInsets.only(
                  left: deviceWidth * 0.05,
                  right: deviceWidth * 0.05,
                  bottom: deviceHeight * 0.12,
                  top: deviceHeight * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextTitle(
                    text: onboardingData[i].title,
                    fontSize: 40,
                    height: 1.1,
                  ),
                  SizedBox(height: deviceHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: deviceWidth * 0.75,
                        child: TextTitle(
                          text: onboardingData[i].description,
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
  ];
}
