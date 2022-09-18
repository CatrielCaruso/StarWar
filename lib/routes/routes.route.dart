import 'package:flutter/material.dart';
import 'package:star_wars/screens/home_screen.screen.dart';

// Crea el Map de rutas de la app.
class AppRoutes {
  static const initialRoute = 'homeScreen';

  static final Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
  };
}
