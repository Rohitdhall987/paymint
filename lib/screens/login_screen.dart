import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/constants/colors.dart';
import 'package:paymint/utils/common.dart';
import 'package:paymint/utils/shared_prefs.dart';
import 'package:paymint/widgets/app_input_field.dart';
import 'package:paymint/widgets/glass_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool hidePassword=true;
  TextEditingController emailCtrl=TextEditingController();
  TextEditingController passwordCtrl=TextEditingController();


  String? emailErr;
  String? passwordErr;



  void validate() async{
    emailErr = null;
    passwordErr = null;

    if (!isValidEmail(emailCtrl.text)) {
      emailErr = 'Enter a valid email address';
    }

    if (passwordCtrl.text.isEmpty) {
      passwordErr = 'Password is required';
    }

    setState(() {});

    if (emailErr == null && passwordErr == null) {
      final savedUser = await SharedPrefs.getUser();

      if (savedUser['email'] == emailCtrl.text &&
          savedUser['password'] == passwordCtrl.text) {

        await SharedPrefs.saveLoginSession(isLoggedIn: true);
        GoRouter.of(context).pushReplacementNamed('Home');

      } else {
        passwordErr = "Invalid credentials";
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffold,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlassContainer(
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            borderRadius: 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome Back",
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
                    errorText: emailErr,
                    hint: "Email"),
                const SizedBox(height: 16),
                AppInputField(
                  controller: passwordCtrl,
                  errorText: passwordErr,
                  hint: "Password",
                  obscureText: hidePassword,
                  suffixIcon:hidePassword? FontAwesomeIcons.eye:FontAwesomeIcons.eyeSlash,
                  onSuffixTap: (){
                    setState(() {
                      hidePassword=!hidePassword;
                    });
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: validate,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Login"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account? ",style: TextStyle(color: AppColors.textPrimary),),
              GestureDetector(
                onTap: ()=>GoRouter.of(context).pushReplacementNamed('Register'),
                  child: Text("Create one!",style: TextStyle(color: AppColors.highlight),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
