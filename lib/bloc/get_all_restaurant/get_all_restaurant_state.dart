part of 'get_all_restaurant_bloc.dart';

sealed class GetAllRestaurantState extends Equatable {
  const GetAllRestaurantState();

  @override
  List<Object> get props => [];
}

final class GetAllRestaurantInitial extends GetAllRestaurantState {}

final class GetAllRestaurantLoading extends GetAllRestaurantState {}

final class GetAllRestaurantSuccess extends GetAllRestaurantState {
 final  List<MyRestaurant> allRestaurant;

 const  GetAllRestaurantSuccess({ required this.allRestaurant});
   @override
  List<Object> get props => [allRestaurant];
}

final class GetAllRestaurantFaliuer extends GetAllRestaurantState {}
