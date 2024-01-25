part of 'get_all_meals_bloc.dart';

abstract class GetMealsBlocEvent extends Equatable {
  @override
  List<Object> get props => [];}
class GetAllMealsEvent extends GetMealsBlocEvent {
   GetAllMealsEvent();

}
class RequiredRestaurant extends GetMealsBlocEvent{
final int requiredRestaurants;

   RequiredRestaurant({required this.requiredRestaurants});
  @override
  List<Object> get props => [];
}
