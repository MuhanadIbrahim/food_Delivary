part of 'meal_required_restaurant_bloc.dart';

sealed class MealRequiredRestaurantInitialEvent extends Equatable {
  const MealRequiredRestaurantInitialEvent();

  @override
  List<Object> get props => [];
}

class MealsRequiredEvent extends MealRequiredRestaurantInitialEvent {
  final int requiredRestaurants;

  const MealsRequiredEvent(this.requiredRestaurants);

  @override
  List<Object> get props => [requiredRestaurants];
}
