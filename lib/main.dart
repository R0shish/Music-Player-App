import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/now_playing/presentation/cubit/now_playing_cubit.dart';
import 'package:music_player/router/app_router.dart';

import 'constants/color_constant.dart';
import 'constants/text_theme.dart';
import 'features/navigation_bar/presentation/cubit/navbar_cubit.dart';
import 'features/navigation_bar/presentation/pages/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
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
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.black,
            foregroundColor: AppColor.secondary,
          )),
      onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => NavbarCubit()),
          BlocProvider(create: (_) => NowPlayingCubit()),
        ],
        child: const NavigationPage(),
      ),
    );
  }
}
