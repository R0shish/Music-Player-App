import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/authentication/presentation/pages/authentication.dart';

import '../../../homescreen/presentation/pages/homescreen.dart';
import '../../../playlist_tab/presentation/pages/playlist.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit()
      : super(const NavbarState(currentIndex: 0, screens: [
          Homescreen(),
          Homescreen(),
          PlaylistPage(),
          Authentication(),
        ]));

  void changePage(int index) => emit(state.changeWith(currentIndex: index));

  Icon getIcon(
          {required int index,
          required IconData selectedIcon,
          required IconData unselectedIcon}) =>
      index == state.currentIndex ? Icon(selectedIcon) : Icon(unselectedIcon);

  List<Widget> get screens => state.screens;
}
