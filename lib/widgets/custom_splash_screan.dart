import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/views/home_screan.dart';
import 'package:page_transition/page_transition.dart';

import '../views/screan1.dart';
import '../views/screan2.dart';

class CustomSplashScreanWidget extends StatelessWidget {
  const CustomSplashScreanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      pageTransitionType: PageTransitionType.fade,
      splashTransition: SplashTransition.rotationTransition,
      duration: 3000,
      splashIconSize: double.infinity,
      splash: const Screan1(),
      nextScreen: (FirebaseAuth.instance.currentUser!= null&& FirebaseAuth.instance.currentUser!.emailVerified)? const HomeScrean():const Screan2(),
    );
  }
}
