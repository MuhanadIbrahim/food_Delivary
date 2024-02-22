// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

class RestaurantMeal {
  MyMeals meal;
  MyRestaurant restaurant;
  RestaurantMeal({
    required this.meal,
    required this.restaurant,
  });
}
