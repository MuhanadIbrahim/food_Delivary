// ignore_for_file: public_member_api_docs, sort_constructors_first
// Cart state management:
import 'package:food_delivery_app/my_meals/meals.dart';

class CartItem {
  MyMeals meal;
  int count;
  CartItem({
    required this.meal,
    required this.count,
  });
}
