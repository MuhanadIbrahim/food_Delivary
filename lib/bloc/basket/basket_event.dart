import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

abstract class BasketEvent {}

class BasketEventAdd extends BasketEvent {
  final MyMeals meal;
  final MyRestaurant restaurant;

  BasketEventAdd({required this.meal,required this.restaurant});
}

class BasketEventRemove extends BasketEvent {}
