import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/basket/basket_item.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/widgets/serach_resulate.dart';

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

      final mealsForRestaurant =
          mealsSnapshot.docs.map((doc) => MyMeals.fromMap(doc.data())).toList();
      meals.addAll(mealsForRestaurant);
      // meals =
      //     mealsSnapshot.docs.map((doc) => MyMeals.fromMap(doc.data())).toList();
    }

    final query = event.query.toLowerCase(); // Ensure case-insensitive search

    final filteredRestaurants = initialRestaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(query) ||
            restaurant.description.toLowerCase().contains(query))
        .map((e) => RestaurantSearchResult(restaurant: e))
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
        .map((e) => MealSearchResault(meal: e))
        .toList();
    final List<SearchResult> combineData = [];
    combineData.addAll(filteredmeal);
    combineData.addAll(filteredRestaurants);
    

    emit(SearchRestaurantLoaded(combinData: combineData));
  }
}
