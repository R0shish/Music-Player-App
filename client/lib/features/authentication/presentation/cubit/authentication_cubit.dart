import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/features/authentication/presentation/widgets/login_screen.dart';

import '../widgets/register_screen.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(const AuthenticationState(currentScreen: LoginScreen()));

  Widget get currentScreen => state.currentScreen;

  void goToLoginScreen() {
    emit(const AuthenticationState(currentScreen: LoginScreen()));
  }

  void goToRegisterScreen() {
    emit(const AuthenticationState(currentScreen: RegisterScreen()));
  }
}
