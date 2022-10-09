import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/constants/constants.dart';
import 'package:music_player/core/presentation/widgets/custom_snackbar.dart';
import 'package:music_player/features/authentication/presentation/widgets/login_screen.dart';
import 'package:music_player/features/profile/presentation/profile.dart';
import 'package:music_player/services/api_handler.dart';

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

  void login({
    required BuildContext context,
    String? email,
    String? password,
    bool mounted = true,
  }) async {
    if (email!.isEmpty) {
      CustomSnackBars.showErrorSnackBar(
        context,
        'Please enter your email address!',
      );
      return;
    }

    if (password!.isEmpty) {
      CustomSnackBars.showErrorSnackBar(
        context,
        'Please enter your password!',
      );
      return;
    }
    try {
      var jsonResponse = await apiHandler(Api.login, 'POST', body: {
        'email': email,
        'password': password,
      });
      if (!mounted) return;
      if (jsonResponse == 'Login successful') {
        emit(const AuthenticationState(currentScreen: ProfileScreen()));
      } else {
        CustomSnackBars.showErrorSnackBar(context, jsonResponse);
      }
    } catch (e) {
      CustomSnackBars.showErrorSnackBar(
          context, 'Error 500: Internal Server Error');
    }
  }
}
