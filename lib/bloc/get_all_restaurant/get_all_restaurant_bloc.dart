import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

part 'get_all_restaurant_event.dart';
part 'get_all_restaurant_state.dart';

class GetAllRestaurantBloc
    extends Bloc<GetAllRestaurantEvent, GetAllRestaurantState> {
  GetAllRestaurantBloc() : super(GetAllRestaurantInitial()) {
    on<GetAllRestaurantEvent>((event, emit) async {
      emit(GetAllRestaurantLoading());
      try {
        final CollectionReference restaurantsCollection = FirebaseFirestore
            .instance
            .collection('restaurant'); // Access the 'restaurants' collection

        final querySnapshot = await restaurantsCollection.get();
        List<MyRestaurant> restaurants = querySnapshot.docs
            .map((doc) => MyRestaurant.fromMap(doc.data()))
            .toList();
        print(
            '================================${restaurants.length.toString()}');

        emit(GetAllRestaurantSuccess(allRestaurant: restaurants));
      } catch (e) {
        emit(GetAllRestaurantFaliuer());
        rethrow;
      }
      
    });
  }
}
