part of 'meal_required_restaurant_bloc.dart';

sealed class MealRequiredRestaurantState extends Equatable {
  const MealRequiredRestaurantState();
  
  @override
  List<Object> get props => [];
}

final class MealRequiredRestaurantInitial extends MealRequiredRestaurantState {}
