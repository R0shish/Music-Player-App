part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final int currentIndex;
  final List<Widget> screens;

  const NavbarState({
    required this.currentIndex,
    required this.screens,
  });

  @override
  List<Object?> get props => [currentIndex];

  changeWith({
    int? currentIndex,
    List<Widget>? screens,
  }) {
    return NavbarState(
      currentIndex: currentIndex ?? this.currentIndex,
      screens: screens ?? this.screens,
    );
  }
}
