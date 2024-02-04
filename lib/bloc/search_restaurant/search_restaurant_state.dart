part of 'search_restaurant_bloc.dart';

abstract class SearchRestaurantState extends Equatable {
  const SearchRestaurantState();

  @override
  List<Object> get props => [];
}

class SearchRestaurantInitial extends SearchRestaurantState {}

class SearchRestaurantLoading extends SearchRestaurantState {}

class SearchRestaurantLoaded extends SearchRestaurantState {
  final List<MyRestaurant> restaurants;

  const SearchRestaurantLoaded({ required this.restaurants});

  @override
  List<Object> get props => [restaurants];
}

// Optional:
class SearchRestaurantFailure extends SearchRestaurantState {
  final String error;

  const SearchRestaurantFailure(this.error);

  @override
  List<Object> get props => [error];
}
