// ignore_for_file: public_member_api_docs, sort_constructors_first
// Cart state management:
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

class CartItem {
  MyMeals meal;
  int count;
  MyRestaurant restaurant;
  CartItem({required this.meal, required this.count, required this.restaurant});
}

class RestaurantMeal {
  MyRestaurant restaurant;
  MyMeals meal;
  RestaurantMeal({
    required this.restaurant,
    required this.meal,
  });
}
