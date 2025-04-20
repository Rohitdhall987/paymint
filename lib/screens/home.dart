import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/utils/no_stretch.dart';
import 'package:paymint/widgets/glass_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> quickActions = const [
    {"icon": FontAwesomeIcons.mobile, "label": "Mobile\nRecharge", "Route":'MobileRechargeScreen'},
    {"icon": FontAwesomeIcons.bolt, "label": "Electricity\nBill", "Route":'ElectricityDetails'},
    {"icon": FontAwesomeIcons.tv, "label": "OTT\nRecharge", "Route":'OTTRecharge'},
    {"icon": FontAwesomeIcons.satelliteDish, "label": "DTH\nRecharge", "Route":'DTHRechargeScreen'},
    {"icon": FontAwesomeIcons.wifi, "label": "Broadband", "Route":'BroadbandRechargeScreen'},
    {"icon": Icons.propane_tank, "label": "LPG\nBooking", "Route":'LPGBookingScreen'},
  ];

  final List<Map<String, dynamic>> spendHistory = const [
    {"icon": FontAwesomeIcons.mobile, "title": "Jio Recharge", "amount": "-₹399"},
    {"icon": FontAwesomeIcons.bolt, "title": "Electricity Bill", "amount": "-₹850"},
    {"icon": FontAwesomeIcons.tv, "title": "Netflix", "amount": "-₹199"},
    {"icon": FontAwesomeIcons.wifi, "title": "Airtel Fiber", "amount": "-₹999"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: NoStretchScrollBehavior(),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              GlassContainer(
                padding: const EdgeInsets.all(20),
                borderRadius: 24,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.primaryAccent.withValues(alpha: 0.1),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello, User 👋",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Welcome to PayMint!",
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Monthly Spend Card
              GlassContainer(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                borderRadius: 20,
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.wallet, color: AppColors.primaryAccent),
                    const SizedBox(width: 12),
                    Text(
                      "₹12,350 spent this month",
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // Quick Actions Header
              Text(
                "Quick Actions",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Quick Actions Grid
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: quickActions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  final action = quickActions[index];
                  return GestureDetector(
                    onTap: ()=>GoRouter.of(context).pushNamed(action['Route']),
                    child: GlassContainer(
                      borderRadius: 20,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(action["icon"], color: AppColors.primaryAccent, size: 28),
                          const SizedBox(height: 10),
                          Text(
                            action["label"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // Spend History Header
              Text(
                "Spending History",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Spending History List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: spendHistory.length,
                itemBuilder: (context, index) {
                  final item = spendHistory[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GlassContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      borderRadius: 16,
                      child: Row(
                        children: [
                          FaIcon(item["icon"], color: AppColors.secondaryAccent, size: 20),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item["title"],
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            item["amount"],
                            style: TextStyle(
                              color: AppColors.highlight,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
