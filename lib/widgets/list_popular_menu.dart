import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';

import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import '../constans/constans.dart';
import 'menu_details_price_card.dart';

class ListPopularMenu extends StatelessWidget {
  const ListPopularMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MealRequiredRestaurantBloc()
          ..add(MealsRequiredEvent(requiredRestaurants: 1)),
        child: BlocBuilder<MealRequiredRestaurantBloc,
            MealRequiredRestaurantState>(
          builder: (context, state) {
            if (state is MealRequiredRestaurantLoading) {
              // Show a loading indicator or any other UI for loading state
              return const Center(child: CircularProgressIndicator());
            } else if (state is MealRequiredRestaurantISuccess) {
              // Update the UI with the fetched data

              return ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: state.allMeals.length,
                itemBuilder: (context, index) {
                  return state.allMeals.isEmpty
                      ? Text('Sorry we are working in our meals')
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, kMealDetailScrean,
                                arguments: state.allMeals[index]);
                          },
                          child: MenuDetailsPriceCard(
                            jpg: state.allMeals[index].picture,
                            title: state.allMeals[index].name,
                            subtitle: '',
                            price: double.parse(state.allMeals[index].price),
                          ),
                        );
                },
              );
            } else if (state is MealRequiredRestaurantFailed) {
              // Handle the failure state
              return Text('Failed to fetch data.');
            } else {
              // Default or initial state
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Photo Restaurantjpg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
