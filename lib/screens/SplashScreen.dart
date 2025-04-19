import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glassContainer.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      //TODO:: navigate to next screen
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlassContainer(margin: EdgeInsets.symmetric(horizontal: 70),child: Image.asset('assets/logo.png')),
          const SizedBox(height: 20,),
          Text(
            "Pay Mint",
            style: TextStyle(
              color: AppColors.primaryAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 12.0,
                  color: AppColors.primaryAccent.withValues(alpha: 0.7),
                  offset: const Offset(0, 0),
                ),
                Shadow(
                  blurRadius: 24.0,
                  color: AppColors.primaryAccent.withValues(alpha: 0.5),
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          )

        ],
      )
    );
  }
}
