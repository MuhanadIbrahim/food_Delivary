import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/widgets/home_screan_body.dart';

import '../bloc/authentication/bloc/authentication_bloc.dart';
import '../bloc/get_all_meals/get_all_meals_bloc.dart';
import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import '../bloc/sign_in/bloc/sign_in_bloc.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //       Navigator.pushReplacementNamed(context, kLoginScrean);
  //       // if (mounted) {
  //       //   Navigator.pushReplacementNamed(context, kLoginScrean);
  //       // }
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
        BlocProvider(
          create: (context) => GetAllRestaurantBloc(),
        ), BlocProvider(
          create: (context) => GetAllMealsBloc(),
        ),
        //  BlocProvider(
        //   create: (context) => MealRequiredRestaurantBloc(),
        // ),
      ],
      child: const HomeScreanBody(),
    );
  }
}
