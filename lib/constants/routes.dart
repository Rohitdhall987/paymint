import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/screens/home.dart';
import 'package:paymint/screens/login_screen.dart';
import 'package:paymint/screens/register.dart';
import 'package:paymint/screens/splash_screen.dart';

GoRouter routes=GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (context,state)=>const LoginScreen(),
  ),
  GoRoute(
    path: '/Register',
    name: 'Register',
    builder: (context,state)=>const Register(),
  ),
  GoRoute(
    path: '/Home',
    name: 'Home',
    builder: (context,state)=>const HomeScreen(),
  ),
]);