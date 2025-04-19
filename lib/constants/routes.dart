import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/screens/SplashScreen.dart';

GoRouter routes=GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
    routes: [],
  ),
]);