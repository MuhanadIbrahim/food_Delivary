import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/views/home_screan.dart';
import 'package:page_transition/page_transition.dart';

import '../views/screan1.dart';
import '../views/screan2.dart';

class CustomSplashScreanWidget extends StatefulWidget {
  const CustomSplashScreanWidget({super.key});

  @override
  State<CustomSplashScreanWidget> createState() =>
      _CustomSplashScreanWidgetState();
}

class _CustomSplashScreanWidgetState extends State<CustomSplashScreanWidget> {
 

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        pageTransitionType: PageTransitionType.fade,
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
        splashIconSize: double.infinity,
        splash: const Screan1(),
        nextScreen: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.status == AuthenticationStatus.authenticated) {
              return const HomeScrean();
            } else {
              return const Screan2();
            }
          },
        ));
  }
}
