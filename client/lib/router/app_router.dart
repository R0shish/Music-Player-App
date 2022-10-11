import 'package:flutter/material.dart';
import 'package:music_player/features/navigation_bar/presentation/pages/navigation_bar.dart';

import '../features/homescreen/presentation/pages/homescreen.dart';

class AppRouter {
  onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => const NavigationPage());

      default:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
