import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example_client/features/error_screen/views/error_screen.dart';
import 'package:flutter_example_client/features/home_screen/views/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter? _router;
  static GoRouter get router {
    _router ??= GoRouter(
      debugLogDiagnostics: kDebugMode,
      routes: [
        GoRoute(
            name: 'home',
            path: '/',
            builder: (context, state) => _build(HomeScreen()))
      ],
      errorBuilder: (context, state) => ErrorScreen(state.error!),
    );

    return _router!;
  }

  static Widget _build(Widget child) => Scaffold(body: child);
}
