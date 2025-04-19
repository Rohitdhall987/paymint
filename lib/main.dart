import 'package:flutter/material.dart';
import 'package:paymint/constants/routes.dart';
import 'package:paymint/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pay Mint',
      theme: payMintTheme,
      routerConfig: routes,
    );
  }
}
