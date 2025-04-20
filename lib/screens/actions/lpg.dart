
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/app_input_field.dart';
import 'package:paymint/widgets/glass_container.dart';

class LPGBookingScreen extends StatelessWidget {
  const LPGBookingScreen({super.key});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GlassContainer(
              padding: const EdgeInsets.all(16),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Select LPG Provider",
                  border: InputBorder.none,
                ),
                dropdownColor: AppColors.background,
                items: ["Indane", "Bharat Gas", "HP Gas"]
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
              hint: "Consumer Number",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => GoRouter.of(context).pushNamed('LPGPayment'),
        backgroundColor: AppColors.primaryAccent,
        label: const Text("Next"),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
