import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glass_container.dart';

class MobileRechargeScreen extends StatefulWidget {
  const MobileRechargeScreen({super.key});

  @override
  State<MobileRechargeScreen> createState() => _MobileRechargeScreenState();
}

class _MobileRechargeScreenState extends State<MobileRechargeScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> previousNumbers = ["9876543210", "9123456789", "9090909090"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Mobile Recharge", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            GlassContainer(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              borderRadius: 16,
              child: TextField(
                controller: _controller,
                style: TextStyle(color: AppColors.textPrimary),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Enter Mobile Number",
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  border: InputBorder.none,
                  icon: Icon(Icons.phone, color: AppColors.primaryAccent),
                ),
              ),
            ),

            const SizedBox(height: 30),
            Text("Previous Numbers", style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 12),

            ...previousNumbers.map((number) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: GlassContainer(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                borderRadius: 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(number, style: TextStyle(color: AppColors.textPrimary)),
                    Icon(Icons.refresh, color: AppColors.highlight),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>GoRouter.of(context).pushNamed('PlanSelectionScreen'),
        backgroundColor: AppColors.primaryAccent,
        label: const Text("Next"),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
