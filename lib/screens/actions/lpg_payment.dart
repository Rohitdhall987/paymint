
import 'package:flutter/material.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/app_input_field.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class LPGPaymentScreen extends StatelessWidget {
  const LPGPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("LPG Booking", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FadeInUp(
              child: AppInputField(hint: "Registered Mobile Number"),
            ),
            const SizedBox(height: 16),
            FadeInUp(
              delay: const Duration(milliseconds: 100),
              child: AppInputField(hint: "Consumer Number"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => GoRouter.of(context).pushNamed('PaymentScreen'),
        backgroundColor: AppColors.primaryAccent,
        label: const Text("Next"),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}