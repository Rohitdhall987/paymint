
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/app_input_field.dart';
import 'package:paymint/widgets/glass_container.dart';

class OTTRechargeScreen extends StatelessWidget {
  const OTTRechargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("OTT Recharge", style: TextStyle(color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GlassContainer(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select OTT Platform",
                  border: InputBorder.none,
                ),
                dropdownColor: AppColors.background,
                items: ["Netflix", "Amazon Prime", "Hotstar", "Zee5"]
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: TextStyle(color: AppColors.textPrimary)),
                ))
                    .toList(),
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 16),
            AppInputField(
              hint: "Mobile/Email linked to account",
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
