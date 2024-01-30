import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/widgets/resturant_body.dart';

import '../bloc/get_all_meals/get_all_meals_bloc.dart';
import '../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';

class ResturantHomeScrean extends StatelessWidget {
  const ResturantHomeScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllRestaurantBloc(),
        ), BlocProvider(
          create: (context) => GetAllMealsBloc(),
        ),
        //  BlocProvider(
        //   create: (context) => MealRequiredRestaurantBloc(),
        // ),
      ],
      child: const ResturantScreanBody(),
    );
  }
}
