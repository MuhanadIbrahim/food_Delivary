import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:food_delivery_app/bloc/my_user_bloc/my_user_bloc.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/views/home_screan.dart';
import 'package:page_transition/page_transition.dart';

import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import '../bloc/sign_in/bloc/sign_in_bloc.dart';
import '../bloc/update_user_info_bloc/update_user_info_bloc.dart';
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
              return MultiBlocProvider(providers: [
                // BlocProvider(create: (context) => MealRequiredRestaurantBloc(),),
                
                BlocProvider(
                  create: (context) => SignInBloc(
                      userRepository:
                          context.read<AuthenticationBloc>().userRepository),
                ),
                // BlocProvider(
                //   create: (context) => UpdateUserInfoBloc(
                //     userRepository: context.read<AuthenticationBloc>().userRepository
                //   ),
                 
                // ),
                BlocProvider(
                  create: (context) => MyUserBloc(
                    myUserRepository: context.read<AuthenticationBloc>().userRepository
                  )..add(GetMyUser(myUserId: context.read<AuthenticationBloc>().state.user!.uid)),
                  
                )
              ], child: const HomeScrean(),);
            } else {
              return  const Screan2();
            }
          },
        ));
  }
}
