import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/utils/shared_prefs.dart';
import 'package:paymint/widgets/glass_container.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkLoginStatus();

  }

  void checkLoginStatus() async {
    final loggedIn = await SharedPrefs.isLoggedIn();
    if (loggedIn) {
      GoRouter.of(context).goNamed('Home');
    } else {
      GoRouter.of(context).goNamed('login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundScaffold,
      body: Center(
        child: GlassContainer(
          margin: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/logo.png'),
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
                      color: AppColors.textPrimary.withValues(alpha: 0.7),
                      offset: const Offset(0, 0),
                    ),
                    Shadow(
                      blurRadius: 24.0,
                      color: AppColors.textPrimary.withValues(alpha: 0.5),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
