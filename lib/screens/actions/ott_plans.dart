import 'package:flutter/material.dart';
import 'package:paymint/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:paymint/widgets/glass_container.dart';

class OTTPlansScreen extends StatelessWidget {
  const OTTPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Choose OTT Plan", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => FadeInUp(
          delay: Duration(milliseconds: 150 * index),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed('PaymentScreen'),
            child: GlassContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("OTT Plan ${index + 1} - ₹${299 + index * 100}",
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Watch unlimited shows and movies", style: TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
