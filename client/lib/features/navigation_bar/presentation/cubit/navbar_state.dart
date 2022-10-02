part of 'navbar_cubit.dart';

class NavbarState extends Equatable {
  final int currentIndex;

  const NavbarState({
    required this.currentIndex,
  });

  @override
  List<Object?> get props => [currentIndex];
}
