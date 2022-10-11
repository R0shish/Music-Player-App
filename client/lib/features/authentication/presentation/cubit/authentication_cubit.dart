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
    _checkEmpty(email!, context: context, fieldName: 'email');
    if (!_validateEmail(email, context: context)) return;
    _checkEmpty(password!, context: context, fieldName: 'password');

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

  void register({
    required BuildContext context,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool mounted = true,
  }) async {
    // Validation
    if (!_checkEmpty(name, context: context, fieldName: 'name')) return;
    if (!_checkEmpty(email, context: context, fieldName: 'email address')) {
      return;
    }
    if (!_validateEmail(email!, context: context)) return;
    if (!_checkEmpty(password, context: context, fieldName: 'password')) return;
    if (!_checkEmpty(confirmPassword,
        context: context, fieldName: 'confirmation password')) return;
    if (password != confirmPassword) {
      CustomSnackBars.showErrorSnackBar(context, 'Passwords do not match');
      return;
    }

    try {
      var jsonResponse = await apiHandler(Api.register, 'POST', body: {
        'name': name!,
        'email': email!,
        'password': password!,
      });
      if (!mounted) return;
      if (jsonResponse == 'Registered successfully') {
        CustomSnackBars.showSuccessSnackBar(context, jsonResponse);
        emit(const AuthenticationState(currentScreen: LoginScreen()));
      } else {
        CustomSnackBars.showErrorSnackBar(context, jsonResponse);
      }
    } catch (e) {
      CustomSnackBars.showErrorSnackBar(
          context, 'Error 500: Internal Server Error');
    }
  }

  bool _checkEmpty(String? field,
      {required BuildContext context, required String fieldName}) {
    if (field!.isEmpty) {
      CustomSnackBars.showErrorSnackBar(
          context, 'Please enter your $fieldName');
      return false;
    }
    return true;
  }

  bool _validateEmail(String value, {required BuildContext context}) {
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      CustomSnackBars.showErrorSnackBar(
          context, 'Please enter a valid email address');
      return false;
    }
    return true;
  }
}
