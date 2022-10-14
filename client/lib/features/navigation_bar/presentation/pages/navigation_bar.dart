import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../constants/constants.dart';
import '../../../../core/presentation/cubit/cubit.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final Box userDataBox = Hive.box('user_data');

  @override
  Widget build(BuildContext context) {
    audioPlayer.setAutomaticallyWaitsToMinimizeStalling(false);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavbarCubit()),
          BlocProvider(create: (context) => NowPlayingCubit()),
          BlocProvider(
              create: (context) => RepeatCubit(audioPlayer: audioPlayer)),
          BlocProvider(create: (context) {
            final cubit = PlaylistCubit();
            cubit.getPlaylist();
            return cubit;
          }),
          BlocProvider(
              create: (context) =>
                  AuthenticationCubit(userDataBox: userDataBox)),
          BlocProvider(
              create: (context) => PlayPauseCubit(
                    nowPlayingCubit: context.read<NowPlayingCubit>(),
                    repeatCubit: context.read<RepeatCubit>(),
                    playlistCubit: context.read<PlaylistCubit>(),
                    audioPlayer: audioPlayer,
                  )),
        ],
        child: Scaffold(
            extendBody: true,
            body: BlocBuilder<NavbarCubit, NavbarState>(
              builder: (context, state) {
                return IndexedStack(
                    index: state.currentIndex, children: state.screens);
              },
            ),
            bottomNavigationBar: ClipRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 25.0,
                      sigmaY: 25.0,
                    ),
                    child: BlocBuilder<NavbarCubit, NavbarState>(
                      builder: (context, state) {
                        return BottomNavigationBar(
                            elevation: 1,
                            iconSize: 30,
                            selectedFontSize: 15,
                            unselectedFontSize: 15,
                            backgroundColor: AppColor.black.withOpacity(0.3),
                            selectedItemColor: AppColor.primary,
                            unselectedItemColor: AppColor.lightGrey,
                            currentIndex: state.currentIndex,
                            onTap: (index) =>
                                context.read<NavbarCubit>().changePage(index),
                            type: BottomNavigationBarType.fixed,
                            items: [
                              BottomNavigationBarItem(
                                  icon: context.read<NavbarCubit>().getIcon(
                                      index: 0,
                                      selectedIcon: Icons.home,
                                      unselectedIcon: Icons.home_outlined),
                                  label: "Home"),
                              BottomNavigationBarItem(
                                  icon: context.read<NavbarCubit>().getIcon(
                                      index: 1,
                                      selectedIcon: Icons.search,
                                      unselectedIcon: Icons.search_outlined),
                                  label: "Explore"),
                              BottomNavigationBarItem(
                                  icon: context.read<NavbarCubit>().getIcon(
                                      index: 2,
                                      selectedIcon: Icons.bookmark,
                                      unselectedIcon: Icons.bookmark_outline),
                                  label: "Playlist"),
                              BottomNavigationBarItem(
                                  icon: context.read<NavbarCubit>().getIcon(
                                      index: 3,
                                      selectedIcon: Icons.person,
                                      unselectedIcon: Icons.person_outline),
                                  label: "Account"),
                            ]);
                      },
                    )))));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    context.read<OnboardingCubit>().close();
    super.dispose();
  }
}
