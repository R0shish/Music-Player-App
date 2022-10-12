import 'package:flutter/material.dart';

import '../model/onboarding_model.dart';

List<Onboarding> onboardingPageData = [
  Onboarding.fromJson({
    "title": "Enjoy Your\nMusic",
    "description":
        "You can enjoy 75 million songs and thousands of exper-programmed playlists and stations.",
    "image": Image.asset("assets/images/onboarding_1.png"),
    "color": const Color.fromARGB(255, 0, 20, 47)
  }),
  Onboarding.fromJson({
    "title": "Listen With\nNo Ads",
    "description":
        "You can enjoy 75 million songs and thousands of exper-programmed playlists and stations.",
    "image": Image.asset("assets/images/onboarding_2.png"),
    "color": const Color.fromARGB(255, 48, 0, 24)
  }),
  Onboarding.fromJson({
    "title": "Listen to your\nfavorite music",
    "description":
        "You can enjoy 75 million songs and thousands of exper-programmed playlists and stations.",
    "image": Image.asset("assets/images/onboarding_3.png"),
    "color": const Color.fromARGB(255, 0, 37, 6)
  })
];
