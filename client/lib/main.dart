import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/features/onboarding/presentation/pages/onboarding_screen.dart';

import 'constants/constants.dart';
import 'router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    // Precache story onboarding images
    for (int i = 1; i < 4; i++) {
      precacheImage(
          Image.asset('assets/images/onboarding_$i.png').image, context);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music Player',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: AppColor.primary,
          secondaryHeaderColor: AppColor.secondary,
          scaffoldBackgroundColor: AppColor.black,
          iconTheme: const IconThemeData(color: AppColor.lightGrey),
          textTheme: textTheme(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.black,
            foregroundColor: AppColor.secondary,
          )),
      onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
      home: const OnboardingScreen(),
    );
  }
}
