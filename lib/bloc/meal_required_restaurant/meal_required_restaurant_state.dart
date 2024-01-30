part of 'meal_required_restaurant_bloc.dart';

sealed class MealRequiredRestaurantState extends Equatable {
  const MealRequiredRestaurantState();
  
  @override
  List<Object> get props => [];
}

final class MealRequiredRestaurantInitial extends MealRequiredRestaurantState {}

final class MealRequiredRestaurantLoading extends MealRequiredRestaurantState {}

final class MealRequiredRestaurantchange extends MealRequiredRestaurantState {}

final class MealRequiredRestaurantISuccess extends MealRequiredRestaurantState {
  final List<MyMeals> allMeals;

  final MyRestaurant restaurant;

  const MealRequiredRestaurantISuccess({required this.allMeals,required this.restaurant});

  @override
  List<Object> get props => [allMeals,restaurant];
}

final class MealRequiredRestaurantFailed extends MealRequiredRestaurantState {}