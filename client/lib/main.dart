import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/core/presentation/cubit/playlist_cubit/playlist_cubit.dart';
import 'package:music_player/features/now_playing/presentation/cubit/repeat_cubit/repeat_cubit.dart';

import 'constants/color_constant.dart';
import 'constants/text_theme.dart';
import 'core/presentation/cubit/play_pause_cubit/cubit/play_pause_cubit.dart';
import 'features/navigation_bar/presentation/cubit/navbar_cubit.dart';
import 'features/navigation_bar/presentation/pages/navigation_bar.dart';
import 'features/now_playing/presentation/cubit/now_playing_cubit/now_playing_cubit.dart';
import 'router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.setAutomaticallyWaitsToMinimizeStalling(false);
  runApp(MyApp(audioPlayer: audioPlayer));
}

class MyApp extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const MyApp({super.key, required this.audioPlayer});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.black,
            foregroundColor: AppColor.secondary,
          )),
      onGenerateRoute: (settings) => appRouter.onGenerateRoute(settings),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavbarCubit()),
          BlocProvider(create: (context) => NowPlayingCubit()),
          BlocProvider(
              create: (context) =>
                  RepeatCubit(audioPlayer: widget.audioPlayer)),
          BlocProvider(create: (context) {
            final cubit = PlaylistCubit();
            cubit.getPlaylist();
            return cubit;
          }),
          BlocProvider(
              create: (context) => PlayPauseCubit(
                    nowPlayingCubit: context.read<NowPlayingCubit>(),
                    repeatCubit: context.read<RepeatCubit>(),
                    playlistCubit: context.read<PlaylistCubit>(),
                    audioPlayer: widget.audioPlayer,
                  )),
        ],
        child: const NavigationPage(),
      ),
    );
  }

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }
}
