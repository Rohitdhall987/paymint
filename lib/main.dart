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
    return
      Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          Image.asset(
            'assets/backdrop.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          MaterialApp.router(
            theme: payMintTheme,
            routerConfig: routes,
      
          ),
        ],
      ),
    );

  }
}
