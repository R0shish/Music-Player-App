import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_player/core/presentation/cubit/cubit.dart';

void main() {
  group('navbarCubit', () {
    NavbarCubit navbarCubit = NavbarCubit();
    setUp(() {
      navbarCubit = NavbarCubit();
    });
    tearDown(() {
      navbarCubit.close();
    });
    test('initial nav bar index is 0', () {
      expect(navbarCubit.state, const NavbarState(currentIndex: 0));
    });

    blocTest<NavbarCubit, NavbarState>(
      'emits [1] when index is 1',
      build: () => navbarCubit,
      act: (cubit) => cubit.changePage(1),
      expect: () => const <NavbarState>[NavbarState(currentIndex: 1)],
    );

    blocTest<NavbarCubit, NavbarState>(
      'emits [2] when index is 2',
      build: () => navbarCubit,
      act: (cubit) => cubit.changePage(2),
      expect: () => const <NavbarState>[NavbarState(currentIndex: 2)],
    );

    blocTest<NavbarCubit, NavbarState>(
      'emits [3] when index is 3',
      build: () => navbarCubit,
      act: (cubit) => cubit.changePage(3),
      expect: () => const <NavbarState>[NavbarState(currentIndex: 3)],
    );
  });
}
