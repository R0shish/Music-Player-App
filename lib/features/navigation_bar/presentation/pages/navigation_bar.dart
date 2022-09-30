import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/color_constant.dart';
import '../../../homescreen/presentation/pages/homescreen.dart';
import '../../../playlist_tab/presentation/pages/playlist.dart';
import '../cubit/navbar_cubit.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  final List<Widget> screens = const <Widget>[
    Homescreen(),
    Homescreen(),
    PlaylistPage(),
    Homescreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: BlocBuilder<NavbarCubit, NavbarState>(
          builder: (context, state) {
            return IndexedStack(index: state.currentIndex, children: screens);
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
                ))));
  }
}
