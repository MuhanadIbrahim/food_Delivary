part of 'meal_required_restaurant_bloc.dart';


class MealsRequiredEvent extends Equatable {
  final int requiredRestaurants;

  const MealsRequiredEvent({ required this.requiredRestaurants});

  @override
  List<Object> get props => [requiredRestaurants];
}
