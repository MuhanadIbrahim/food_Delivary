import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/basket/basket_item.dart';
import 'package:food_delivery_app/bloc/basket/basket_event.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  List<CartItem> cartItems = [];
  BasketBloc() : super(BasketInitial()) {
    on<BasketEvent>((event, emit) async {
      if (event is BasketEventAdd) {
        MyMeals meal = event.meal;
        MyRestaurant restaurant = event.restaurant;

        if (cartItems.map((e) => e.meal).contains(meal)) {
          cartItems.firstWhere((element) => element.meal == meal).count++;
        } else {
          cartItems.add(CartItem(count: 1, meal: meal,restaurant: restaurant));
        }
        emit(BasketAddItemSuccfuly());
      } else if (event is BasketEventRemove) {
        emit(BasketRemovedItemSuccfuly());
      }
    });
  }
}
