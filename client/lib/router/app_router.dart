import 'package:flutter/material.dart';
import 'package:music_player/features/register/presentation/pages/register_screen.dart';

import '../features/homescreen/presentation/pages/homescreen.dart';
import '../features/login/presentation/pages/login_screen.dart';

class AppRouter {
  onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Homescreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
