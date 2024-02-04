import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../my_restaurant/restaurant.dart';

part 'search_restaurant_event.dart';
part 'search_restaurant_state.dart';

class SearchRestaurantBloc
    extends Bloc<SearchRestaurantEvent, SearchRestaurantState> {
  final List<MyRestaurant> initialRestaurants;

  SearchRestaurantBloc(this.initialRestaurants)
      : super(SearchRestaurantInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  void _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchRestaurantState> emit) {
    final query = event.query.toLowerCase(); // Ensure case-insensitive search

    final filteredRestaurants = initialRestaurants
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(query) )
        .toList();

    emit(SearchRestaurantLoaded(restaurants: filteredRestaurants));
  }
}
