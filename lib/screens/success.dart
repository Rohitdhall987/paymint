import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:paymint/constants/colors.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).go('/Home');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/success.json',
              width: 180,
              repeat: false,
            ),
            const SizedBox(height: 24),
            Text(
              "Payment Successful!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryAccent,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: AppColors.primaryAccent.withOpacity(0.6),
                    offset: const Offset(0, 2),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Thank you for using PayMint.",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
