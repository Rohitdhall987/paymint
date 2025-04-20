
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glass_container.dart';

class ElectricityInputScreen extends StatelessWidget {
  const ElectricityInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Electricity Bill", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            GlassContainer(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select State",
                  border: InputBorder.none,
                ),
                dropdownColor: AppColors.background,
                items: ["Haryana", "Delhi", "Maharashtra"]
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: TextStyle(color: AppColors.textPrimary)),
                ))
                    .toList(),
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 20),

            GlassContainer(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Electricity Board",
                  border: InputBorder.none,
                ),
                dropdownColor: AppColors.background,
                items: ["UHBVN", "DHBVN", "BSES"]
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: TextStyle(color: AppColors.textPrimary)),
                ))
                    .toList(),
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 20),

            GlassContainer(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                style: TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  labelText: "Consumer Number",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>GoRouter.of(context).pushNamed('ElectricityBillDetails'),
        backgroundColor: AppColors.primaryAccent,
        label: const Text("Next"),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}