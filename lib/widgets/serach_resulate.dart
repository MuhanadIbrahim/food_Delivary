// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

sealed class SearchResult {
  
}

class MealSearchResault extends SearchResult {
  MyMeals meal;
  MealSearchResault({
    required this.meal,
  });
}

class RestaurantSearchResult extends SearchResult {
  MyRestaurant restaurant;
  RestaurantSearchResult({
    required this.restaurant,
  });
}
