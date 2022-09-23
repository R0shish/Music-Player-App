import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(const NavbarState(currentIndex: 0));

  void changePage(int index) => emit(NavbarState(currentIndex: index));

  Icon getIcon(
          {required int index,
          required IconData selectedIcon,
          required IconData unselectedIcon}) =>
      index == state.currentIndex ? Icon(selectedIcon) : Icon(unselectedIcon);
}
