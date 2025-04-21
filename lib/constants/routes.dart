import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paymint/screens/actions/broad_band_plans.dart';
import 'package:paymint/screens/actions/broadband.dart';
import 'package:paymint/screens/actions/dth_plans.dart';
import 'package:paymint/screens/actions/dth_select.dart';
import 'package:paymint/screens/actions/electricity_bill.dart';
import 'package:paymint/screens/actions/electricity_bill_details_screen.dart';
import 'package:paymint/screens/actions/lpg.dart';
import 'package:paymint/screens/actions/lpg_payment.dart';
import 'package:paymint/screens/actions/mobile_plan_selection_screen.dart';
import 'package:paymint/screens/actions/mobile_recharge_screen.dart';
import 'package:paymint/screens/actions/ott_plans.dart';
import 'package:paymint/screens/actions/ott_select.dart';
import 'package:paymint/screens/home.dart';
import 'package:paymint/screens/login_screen.dart';
import 'package:paymint/screens/payment_options.dart';
import 'package:paymint/screens/register.dart';
import 'package:paymint/screens/splash_screen.dart';
import 'package:paymint/screens/success.dart';

GoRouter routes=GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const SplashScreen();
    },
  ),
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (context,state)=>const LoginScreen(),
  ),
  GoRoute(
    path: '/Register',
    name: 'Register',
    builder: (context,state)=>const Register(),
  ),
  GoRoute(
    path: '/Home',
    name: 'Home',
    builder: (context,state)=>const HomeScreen(),
    routes: [
      GoRoute(
          path: 'MobileRecharge',
          name: 'MobileRechargeScreen',
          builder: (context,state)=>const MobileRechargeScreen(),
          routes: [
            GoRoute(
              path: 'plan',
              name: 'PlanSelectionScreen',
              builder: (context,state)=>const PlanSelectionScreen(),
            )
          ]
      ),
      GoRoute(
          path: 'ElectricityInput',
          name: 'ElectricityDetails',
          builder: (context,state)=>const ElectricityInputScreen(),
          routes: [
            GoRoute(
              path: 'details',
              name: 'ElectricityBillDetails',
              builder: (context,state)=>const ElectricityBillDetailsScreen(),
            )
          ]
      ),
      GoRoute(
          path: 'OTTRecharge',
          name: 'OTTRecharge',
          builder: (context,state)=>const OTTRechargeScreen(),
          routes: [
            GoRoute(
              path: 'OTTPlans',
              name: 'OTTPlansScreen',
              builder: (context,state)=>const OTTPlansScreen(),
            )
          ]
      ),
      GoRoute(
          path: 'DTHRecharge',
          name: 'DTHRechargeScreen',
          builder: (context,state)=>const DTHRechargeScreen(),
          routes: [
            GoRoute(
              path: 'DTHPlans',
              name: 'DTHPlansScreen',
              builder: (context,state)=>const DTHPlansScreen(),
            )
          ]
      ),
      GoRoute(
          path: 'BroadbandRecharge',
          name: 'BroadbandRechargeScreen',
          builder: (context,state)=>const BroadbandRechargeScreen(),
          routes: [
            GoRoute(
              path: 'BroadbandPlans',
              name: 'BroadbandPlansScreen',
              builder: (context,state)=>const BroadbandPlansScreen(),
            )
          ]
      ),
      GoRoute(
          path: 'LPGBooking',
          name: 'LPGBookingScreen',
          builder: (context,state)=>const LPGBookingScreen(),
          routes: [
            GoRoute(
              path: 'LPGPayment',
              name: 'LPGPaymentScreen',
              builder: (context,state)=>const LPGPaymentScreen(),
            )
          ]
      ),
    ],
  ),
  GoRoute(
    path: '/Payment',
    name: 'PaymentScreen',
    builder: (context,state)=>const PaymentScreen(),
  ),
  GoRoute(
    path: '/Success',
    name: 'SuccessScreen',
    builder: (context,state)=>const SuccessScreen(),
  ),
]);