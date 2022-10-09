part of 'authentication_cubit.dart';

class AuthenticationState {
  final bool isLoggedIn;
  final Widget currentScreen;
  const AuthenticationState(
      {this.isLoggedIn = false, required this.currentScreen});
}
