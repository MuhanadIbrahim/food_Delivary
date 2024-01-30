import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../my_meals/meals.dart';
import '../../my_restaurant/restaurant.dart';

part 'meal_required_restaurant_event.dart';
part 'meal_required_restaurant_state.dart';

class MealRequiredRestaurantBloc
    extends Bloc<MealsRequiredEvent, MealRequiredRestaurantState> {
  MealRequiredRestaurantBloc() : super(MealRequiredRestaurantInitial()) {
    on<MealsRequiredEvent>((event, emit) async {
      emit(MealRequiredRestaurantLoading());
      try {
        final restaurantsCollection =
            FirebaseFirestore.instance.collection('restaurant');
        final querySnapshot = await restaurantsCollection.get();
        final restaurants = querySnapshot.docs
            .map((doc) => MyRestaurant.fromMap(doc.data()))
            .toList();
        final selectedRestaurant = restaurants[event.requiredRestaurants];
        print('~~~~~~~~~~~~~~~~~~~~~~~~~${selectedRestaurant.id}');

        final mealsSnapshot = await FirebaseFirestore.instance
            .collection('restaurant')
            .doc(selectedRestaurant.id)
            .collection('meals')
            .get();
        final meals = mealsSnapshot.docs
            .map((doc) => MyMeals.fromMap(doc.data()))
            .toList();

        print(
            '?????????????????????????????????Restaurant: $selectedRestaurant');
        print('??????????????????????????????????????????Meals: $meals');
        emit(MealRequiredRestaurantchange());
        emit(MealRequiredRestaurantISuccess(
            allMeals: meals, restaurant: selectedRestaurant));
      } catch (e) {
        // Handle error gracefully, display user-friendly message
        emit(MealRequiredRestaurantFailed());
        rethrow;
      }
    });
  }
}
