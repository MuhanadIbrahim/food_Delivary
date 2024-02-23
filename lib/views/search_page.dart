import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/basket/basket_item.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';
import 'package:food_delivery_app/views/all_restaurant_page.dart';
import 'package:food_delivery_app/widgets/content_card.dart';
import 'package:food_delivery_app/widgets/meal_basket_card.dart';
import 'package:food_delivery_app/widgets/serach_resulate.dart';

import '../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';

import '../bloc/search_restaurant/search_restaurant_bloc.dart';

// ... other imports

class RestaurantSearchScreen extends StatelessWidget {
  const RestaurantSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllRestaurantBloc()..add(GetAllRestaurantEvent()),
      child: BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
        builder: (context, restaurantsState) {
          if (restaurantsState is GetAllRestaurantSuccess) {
            return BlocProvider(
              create: (context) =>
                  SearchRestaurantBloc(restaurantsState.allRestaurant),
              child: RestaurantSearchWidget(),
            );
          } else {
            return Center(
              child:
                  CircularProgressIndicator(), // Or handle loading/error states
            );
          }
        },
      ),
    );
  }
}

class RestaurantSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchRestaurantBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Restaurants'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              onChanged: (query) => searchBloc.add(SearchQueryChanged(query)),
            ),
            BlocBuilder<SearchRestaurantBloc, SearchRestaurantState>(
              builder: (context, state) {
                if (state is SearchRestaurantLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.combinData.length,
                      itemBuilder: (context, index) {
                        // RestaurantMeal restaurantMeal = RestaurantMeal(
                        //     restaurant: state.restaurants[index],
                        //     meal: state.meals[index]);
                        final item = state.combinData[index];
                        if (item is RestaurantSearchResult) {
                          var restaurant = item.restaurant;
                          return ContentResturantCard(
                            jpg: restaurant.picture!,
                            title: restaurant.name,
                            subtitle: restaurant.phoneNumber.toString(),
                          ); // Replace with your restaurant display widget
                        } else if (item is MealSearchResault) {
                          var meal = item.meal;
                          return MealBasketCard(
                              jpg: meal.picture,
                              subtitle: meal.description,
                              title: meal.name,
                              price: double.parse(meal
                                  .price)); // Replace with your meal display widget
                        } else {
                          return const Text(
                              'Unexpected item type'); // Handle unexpected cases
                        }
                        // return Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: ListTile(
                        //     title: Text(state.restaurants[index].name),
                        //   ),
                        // );
                        //Text(state.restaurants[index].name);
                      },
                    ),
                  );
                } else {
                  return Text('No results');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
