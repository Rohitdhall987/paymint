import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glass_container.dart';

class PlanSelectionScreen extends StatelessWidget {
  const PlanSelectionScreen({super.key});

  final List<Map<String, String>> plans = const [
    {
      "price": "₹199",
      "data": "1.5GB/day",
      "validity": "28 Days",
      "desc": "Unlimited calls + 100 SMS/day"
    },
    {
      "price": "₹399",
      "data": "2GB/day",
      "validity": "56 Days",
      "desc": "OTT + Unlimited calls"
    },
    {
      "price": "₹599",
      "data": "3GB/day",
      "validity": "84 Days",
      "desc": "OTT + Disney+ + Prime"
    },
    {
      "price": "₹1499",
      "data": "2GB/day",
      "validity": "365 Days",
      "desc": "Full year + streaming apps"
    },
  ];

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
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: FadeInUp(
              delay: Duration(milliseconds: 250 * index),
              child: GlassContainer(
                borderRadius: 20,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(plan["price"]!, style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryAccent,
                        shadows: [
                          Shadow(
                            color: AppColors.primaryAccent.withValues(alpha: 0.5),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          )
                        ]
                    )),
                    const SizedBox(height: 8),
                    Text("${plan["data"]} • ${plan["validity"]}", style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                    )),
                    const SizedBox(height: 6),
                    Text(plan["desc"]!, style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                    )),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: ()=>GoRouter.of(context).pushNamed('PaymentScreen'),
                        child: const Text("Recharge"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
