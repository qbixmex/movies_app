import 'package:flutter/material.dart' show Widget;

class MenuOptions {
  final String route;
  final String routeName;
  final Widget screen;

  MenuOptions({
    required this.route,
    required this.routeName,
    required this.screen,
  });
}
