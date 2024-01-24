part of 'get_all_meals_bloc.dart';
sealed class GetAllMealsState extends Equatable {
  const GetAllMealsState();

  @override
  List<Object> get props => [];
}

final class GetAllMealsInitial extends GetAllMealsState {}

final class GetAllMealsFailuer extends GetAllMealsState {}

final class GetAllMealsSuccess extends GetAllMealsState {
  final List<MyMeals> allMeals;

  const GetAllMealsSuccess({required this.allMeals});

  @override
  List<Object> get props => [allMeals];
}

final class GetAllMealsLoading extends GetAllMealsState {}
