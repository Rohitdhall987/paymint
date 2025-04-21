
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glass_container.dart';

class BroadbandPlansScreen extends StatelessWidget {
  const BroadbandPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Select Plan", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed('PaymentScreen'),
          child: FadeInUp(
            delay: Duration(milliseconds: 150 * index),
            child: GlassContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Plan ${index + 1} - ₹${(index + 1) * 199}",
                      style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 6),
                  Text("100 Mbps | Unlimited Data | 30 Days",
                      style: TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
