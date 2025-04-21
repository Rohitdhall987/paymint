import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glass_container.dart';

class ElectricityBillDetailsScreen extends StatelessWidget {
  const ElectricityBillDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              duration: const Duration(milliseconds: 500),
              child: GlassContainer(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text("Amount Due: ₹780", style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: 12),
                    Text("Due Date: 25 Apr 2025", style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: ()=>GoRouter.of(context).pushNamed('PaymentScreen'),
              child: const Text("Proceed to Payment"),
            ),
          ],
        ),
      ),
    );
  }
}
