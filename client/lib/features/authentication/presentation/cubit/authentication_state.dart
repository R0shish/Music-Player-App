part of 'authentication_cubit.dart';

class AuthenticationState {
  final bool isLoggedIn;
  final bool isLoading;
  final Widget currentScreen;
  const AuthenticationState(
      {this.isLoggedIn = false,
      required this.currentScreen,
      this.isLoading = false});

  copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    Widget? currentScreen,
  }) {
    return AuthenticationState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      currentScreen: currentScreen ?? this.currentScreen,
    );
  }
}
