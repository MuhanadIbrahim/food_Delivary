import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

import '../../my_meals/meals.dart';

part 'get_all_meals_event.dart';
part 'get_all_meals_state.dart';

class GetAllMealsBloc extends Bloc<GetMealsBlocEvent, GetAllMealsState> {
  GetAllMealsBloc() : super(GetAllMealsInitial()) {
    on<GetAllMealsEvent>(
      (event, emit) async {
        emit(GetAllMealsLoading());
        try {
          final CollectionReference mealsCollection = FirebaseFirestore.instance
              .collection('meals'); // Access the 'meals' collection directly

          final querySnapshot = await mealsCollection.get();

          List<MyMeals> meals = querySnapshot.docs
              .map((doc) => MyMeals.fromMap(doc.data()))
              .toList();

          print('================================${meals.length.toString()}');

          emit(GetAllMealsSuccess(allMeals: meals));
        } catch (e) {
          emit(GetAllMealsFailuer());
          rethrow;
        }
      },
    );
    on<RequiredRestaurant>(
      (event, emit) async {
        try {
          final restaurantsCollection = FirebaseFirestore.instance.collection('restaurant');
          final querySnapshot = await restaurantsCollection.get();
          final restaurants = querySnapshot.docs.map((doc) => MyRestaurant.fromMap(doc.data())).toList();
          final selectedRestaurant = restaurants[event.requiredRestaurants];
          print('~~~~~~~~~~~~~~~~~~~~~~~~~${selectedRestaurant.id}');

          final mealsSnapshot = await FirebaseFirestore.instance
              .collection('restaurant')
              .doc(selectedRestaurant.id)
              .collection('meals')
              .get();
          final meals = mealsSnapshot.docs.map((doc) => MyMeals.fromMap(doc.data())).toList();

          print('Restaurant: $selectedRestaurant');
          print('Meals: $meals');
          emit(MealOfRequiredRestaurant(allMeals: meals, restaurant: selectedRestaurant));
        } catch (e) {
          // Handle error gracefully, display user-friendly message
        
        }
      },
    );
  }
}
