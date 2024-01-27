import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meal_required_restaurant_event.dart';
part 'meal_required_restaurant_state.dart';

class MealRequiredRestaurantBloc extends Bloc<
    MealRequiredRestaurantInitialEvent, MealRequiredRestaurantState> {
  MealRequiredRestaurantBloc() : super(MealRequiredRestaurantInitial()) {
    on<MealRequiredRestaurantInitialEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
