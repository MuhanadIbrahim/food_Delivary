part of 'search_restaurant_bloc.dart';

abstract class SearchRestaurantState {
  const SearchRestaurantState();
}

class SearchRestaurantInitial extends SearchRestaurantState {}

class SearchRestaurantLoading extends SearchRestaurantState {}

class SearchRestaurantLoaded extends SearchRestaurantState {
  // final List<MyRestaurant> restaurants;
  // final List<MyMeals> meals;
  final List <SearchResult
  >combinData;

  const SearchRestaurantLoaded({required this.combinData}
      );
}

// Optional:
class SearchRestaurantFailure extends SearchRestaurantState {
  final String error;

  const SearchRestaurantFailure(this.error);
}
