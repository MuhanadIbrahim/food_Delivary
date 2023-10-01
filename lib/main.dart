import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/views/login_screan.dart';
import 'package:food_delivery_app/views/payment_method.dart';
import 'package:food_delivery_app/views/screan1.dart';
import 'package:food_delivery_app/views/screan2.dart';
import 'package:food_delivery_app/views/screan3.dart';
import 'package:food_delivery_app/views/set_location_screan.dart';
import 'package:food_delivery_app/views/sign_up_process.dart';
import 'package:food_delivery_app/views/sign_up_screan.dart';
import 'package:food_delivery_app/views/signup_success_notication_screan.dart';
import 'package:food_delivery_app/views/upload_preview_screan.dart';
import 'package:food_delivery_app/views/upload_screan.dart';

import 'widgets/custom_splash_screan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        kScrean1: (context) => const Screan1(),
        kScrean2: (context) => const Screan2(),
        kScrean3: (context) => const Screan3(),
        kLoginScrean: (context) => const LoginScrean(),
        kSignUpScrean: (context) => const SignUpScrean(),
        kSignUpProcess: (context) => const SignUpProcess(),
        kPaymentMethod: (context) => const PaymentMethodScrean(),
        kUplaodScrean: (context) => const UploadScrean(),
        kUploadPreview: (context) => const UploadPreviewScrean(),
        kSetLocationScrean: (context) => const SetLocationScrean(),
        kSignUpSuccessNotification:(context) => const SignupSuccessNotifaction(),
      },
      home: const CustomSplashScreanWidget(), // Set the initial page
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
    );
  }
}
