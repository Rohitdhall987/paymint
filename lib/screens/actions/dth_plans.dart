import 'package:flutter/material.dart';
import 'package:paymint/constants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';
import 'package:paymint/widgets/glass_container.dart';

class DTHPlansScreen extends StatelessWidget {
  const DTHPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Select DTH Plan", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => FadeInUp(
          delay: Duration(milliseconds: 100 * index),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed('PaymentScreen'),
            child: GlassContainer(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DTH Plan ${index + 1} - ₹${250 + index * 50}",
                      style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 8),
                  Text("150+ Channels | 30 Days", style: TextStyle(color: AppColors.textSecondary)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}