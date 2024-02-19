import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/my_meals/meals.dart';

abstract class BasketEvent {}

class BasketEventAdd extends BasketEvent {
  final MyMeals meal;

  BasketEventAdd({required this.meal});
}

class BasketEventRemove extends BasketEvent {}
