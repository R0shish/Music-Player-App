import 'package:flutter/material.dart';

import '../features/homescreen/presentation/pages/homescreen.dart';

class AppRouter {
  onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Homescreen());

      default:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
