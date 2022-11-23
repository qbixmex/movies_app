import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/screens/screens.dart';

class AppRoutes {

  static const initialRoute = 'home';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
      route: 'details',
      routeName: 'Details Screen',
      screen: const DetailsScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {

    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({ 'home': (_) => const HomeScreen() });

    for(final option in menuOptions) {
      appRoutes.addAll({ option.route: (_) => option.screen });
    }

    return appRoutes;

  }

  // TODO: Dynamic Routes
  // static Route<dynamic> onGenerateRoute(RouteSettings settings) {
  //   return MaterialPageRoute(
  //     builder: (context) => const SomeScreen(),
  //   );
  // }

}