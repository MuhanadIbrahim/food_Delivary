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
          final CollectionReference restaurantsCollection = FirebaseFirestore
              .instance
              .collection('restaurant'); // Access the 'restaurants' collection

          final querySnapshot = await restaurantsCollection.get();
          List<MyRestaurant> restaurants = querySnapshot.docs
              .map((doc) => MyRestaurant.fromMap(doc.data()))
              .toList();
          print('~~~~~~~~~~~~~~~~~~~~~~~~~${restaurants[event.requiredRestaurants].id}');

          FirebaseFirestore firestore = FirebaseFirestore.instance;


          firestore.collection('restaurant')
    .get()
    .then((QuerySnapshot querySnapshot) {
  querySnapshot.docs.forEach((restaurantDoc) {
    final restaurant = restaurantDoc.data();
    final restaurantId = restaurants[event.requiredRestaurants].id;

    // Fetch meals for the current restaurant
    firestore.collection('restaurant')
      .doc(restaurantId)
      .collection('meals')
      .get()
      .then((QuerySnapshot mealsSnapshot) {
      List<MyMeals> meals = mealsSnapshot.docs.map((mealDoc) => MyMeals.fromMap(mealDoc.data())).toList();

      // Process the restaurant and its meals
      print('Restaurant: $restaurant');
      print('Meals: $meals');
      
      // Display the restaurant and meals in your UI as needed
    });
  });
});


          
        } catch (e) {
          rethrow;
        }
      },
    );
  }
}
