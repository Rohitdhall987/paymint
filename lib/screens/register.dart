import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/utils/common.dart';
import 'package:paymint/utils/shared_prefs.dart';
import 'package:paymint/widgets/app_input_field.dart';
import 'package:paymint/widgets/glass_container.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool hidePassword = true;

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmPasswordCtrl = TextEditingController();

  String? emailErr;
  String? usernameErr;
  String? phoneErr;
  String? passwordErr;
  String? confirmPasswordErr;



  void validate() async {
    setState(() {
      emailErr = null;
      usernameErr = null;
      phoneErr = null;
      passwordErr = null;
      confirmPasswordErr = null;

      if (emailCtrl.text.isEmpty || !isValidEmail(emailCtrl.text)) {
        emailErr = 'Enter a valid email';
      }

      if (usernameCtrl.text.isEmpty) {
        usernameErr = 'Username is required';
      }

      if (phoneCtrl.text.isEmpty || phoneCtrl.text.length < 10) {
        phoneErr = 'Enter a valid phone number';
      }

      if (passwordCtrl.text.isEmpty) {
        passwordErr = 'Password is required';
      }

      if (confirmPasswordCtrl.text.isEmpty ||
          confirmPasswordCtrl.text != passwordCtrl.text) {
        confirmPasswordErr = 'Passwords do not match';
      }
    });

    if(emailErr==null && passwordErr==null && usernameErr==null && phoneErr==null && confirmPasswordErr==null){
      await SharedPrefs.saveUser(
        email: emailCtrl.text,
        username: usernameCtrl.text,
        phone: phoneCtrl.text,
        password: passwordCtrl.text,
      );
      await SharedPrefs.saveLoginSession(isLoggedIn: true);

      GoRouter.of(context).pushReplacementNamed('Home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            GlassContainer(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              borderRadius: 24,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome to Pay Mint",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                      shadows: [
                        Shadow(
                          color: AppColors.primaryAccent.withValues(alpha: 0.4),
                          blurRadius: 16,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    controller: emailCtrl,
                    errorText: emailErr ,
                    hint: "Email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    controller: usernameCtrl,
                    errorText:  usernameErr ,
                    hint: "User Name",
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    controller: phoneCtrl,
                    errorText:phoneErr ,
                    hint: "Phone Number",
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    controller: passwordCtrl,
                    errorText:  passwordErr ,
                    hint: "Password",
                    obscureText: hidePassword,
                    suffixIcon: hidePassword
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                    onSuffixTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  const SizedBox(height: 14),
                  AppInputField(
                    controller: confirmPasswordCtrl,
                    errorText:confirmPasswordErr ,
                    hint: "Confirm Password",
                    obscureText: hidePassword,

                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: validate,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Register"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                GestureDetector(
                  onTap: () => GoRouter.of(context).pushReplacementNamed('login'),
                  child: Text(
                    "Sign In!",
                    style: TextStyle(color: AppColors.highlight),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
