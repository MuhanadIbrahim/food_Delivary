import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/basket/basket_item.dart';
import 'package:food_delivery_app/my_meals/meals.dart';

import '../../my_restaurant/restaurant.dart';

part 'search_restaurant_event.dart';
part 'search_restaurant_state.dart';

class SearchRestaurantBloc
    extends Bloc<SearchRestaurantEvent, SearchRestaurantState> {
  final List<MyRestaurant> initialRestaurants;
  List<MyMeals> meals = [];
  List<dynamic> restaurntMeal = [];

  SearchRestaurantBloc(this.initialRestaurants)
      : super(SearchRestaurantInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchRestaurantState> emit) async {
    final restaurantsCollection =
        FirebaseFirestore.instance.collection('restaurant');
    final querySnapshot = await restaurantsCollection.get();
    final restaurants = querySnapshot.docs
        .map((doc) => MyRestaurant.fromMap(doc.data()))
        .toList();

    for (int i = 0; i < restaurants.length; i++) {
      final mealsSnapshot = await FirebaseFirestore.instance
          .collection('restaurant')
          .doc(restaurants[i].id)
          .collection('meals')
          .get();

           final mealsForRestaurant = mealsSnapshot.docs
      .map((doc) => MyMeals.fromMap(doc.data()))
      .toList();
  meals.addAll(mealsForRestaurant); 
      // meals =
      //     mealsSnapshot.docs.map((doc) => MyMeals.fromMap(doc.data())).toList();
    }

    final query = event.query.toLowerCase(); // Ensure case-insensitive search

    final filteredRestaurants = initialRestaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(query) ||
            restaurant.description.toLowerCase().contains(query))
        .toList();
    restaurntMeal = [meals, initialRestaurants];
    final filteredmeal = meals
        .where(
          (meal) =>
              meal.name.toLowerCase().contains(query) ||
              meal.description.toLowerCase().contains(query) ||
              meal.price.contains(query)
          //

          ,
        )
        .toList();

    final List<dynamic> combineData = [filteredmeal,filteredRestaurants];
    // Filter based on query
    // ignore: unused_local_variable
    // final filteredResults = restaurntMeal.where((item) {
    //   if (item is MyRestaurant) {
    //     return item.name.toLowerCase().contains(query) ||
    //         item.description.toLowerCase().contains(query);
    //   } else if (item is MyMeals) {
    //     return item.name.toLowerCase().contains(query) ||
    //         item.description.toLowerCase().contains(query) ||
    //         item.price.contains(query); // Search within restaurant name too
    //   } else {
    //     final restaurant = item as MyRestaurant?;
    //     final meal = item as MyMeals?;
    //     return restaurant?.name.toLowerCase().contains(query) ??
    //         false || restaurant!.description!.toLowerCase().contains(query) ??
    //         false || meal!.name.toLowerCase().contains(query) ??
    //         false || meal!.description.toLowerCase().contains(query) ??
    //         false || meal!.price.contains(query) ??
    //         false;
    //   }
    // }).toList();

    emit(SearchRestaurantLoaded(meals: filteredmeal,restaurants: filteredRestaurants));
  }
}
