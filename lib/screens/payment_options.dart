import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/widgets/glass_container.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedMethod;

  final TextEditingController upiController = TextEditingController();
  final TextEditingController cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final paymentMethods = [
      {'label': 'UPI', 'icon': Icons.account_balance_wallet ,'speed':100},

      {'label': 'Credit/Debit Card', 'icon': Icons.credit_card,'speed':200},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Choose Payment Method"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...paymentMethods.map((method) {
            return GestureDetector(
              onTap: () => setState(() => selectedMethod = method['label'].toString()),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FadeInUp(
                  delay: Duration(milliseconds: method['speed'] as int),
                  child: GlassContainer(
                    padding: const EdgeInsets.all(16),
                    borderRadius: 20,
                    child: Row(
                      children: [
                        Icon(method['icon'] as IconData,
                            color: AppColors.secondaryAccent, size: 28),
                        const SizedBox(width: 16),
                        Text(
                          method['label'].toString(),
                          style: const TextStyle(
                              fontSize: 16, color: AppColors.textPrimary),
                        ),
                        const Spacer(),
                        Icon(
                          selectedMethod == method['label']
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          color: AppColors.primaryAccent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),

          const SizedBox(height: 24),

          if (selectedMethod == 'UPI') ...[
            const Text('Enter UPI ID', style: TextStyle(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            GlassContainer(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: upiController,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: const InputDecoration(
                  hintText: 'example@upi',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  border: InputBorder.none,
                ),
              ),
            ),
          ] else if (selectedMethod == 'Credit/Debit Card') ...[
            const Text('Enter Card Number', style: TextStyle(color: AppColors.textPrimary)),
            const SizedBox(height: 8),
            GlassContainer(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: cardController,
                style: const TextStyle(color: AppColors.textPrimary),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'XXXX XXXX XXXX XXXX',
                  hintStyle: TextStyle(color: AppColors.textSecondary),
                  border: InputBorder.none,
                ),
              ),
            ),
          ]
          // More methods can have similar blocks...
        ],
      ),
      floatingActionButton: selectedMethod == null
          ? null
          : FloatingActionButton.extended(
        backgroundColor: AppColors.primaryAccent,
        onPressed: () {
          // collect data and navigate
          print("Selected: $selectedMethod");
          if (selectedMethod == 'UPI') print("UPI ID: ${upiController.text}");
          if (selectedMethod == 'Credit/Debit Card') print("Card: ${cardController.text}");

          GoRouter.of(context).pushNamed('SuccessScreen');
        },
        label: const Text("Proceed"),
        icon: const Icon(Icons.check_circle),
      ),
    );
  }
}

