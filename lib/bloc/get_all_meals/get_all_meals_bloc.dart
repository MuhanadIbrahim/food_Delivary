import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../my_meals/meals.dart';

part 'get_all_meals_event.dart';
part 'get_all_meals_state.dart';

class GetAllMealsBloc extends Bloc<GetAllMealsEvent, GetAllMealsState> {
  GetAllMealsBloc() : super(GetAllMealsInitial()) {
    on<GetAllMealsEvent>((event, emit) async {
      emit(GetAllMealsLoading());
      try {
        final CollectionReference mealsCollection = FirebaseFirestore.instance
            .collection('meals'); // Access the 'meals' collection directly

        final querySnapshot = await mealsCollection.get();
        List<MyMeals> meals = querySnapshot.docs
            .map((doc) => MyMeals.fromMap(doc.data()))
            .toList();

        emit(GetAllMealsSuccess(allMeals: meals));
      } catch (e) {
        emit(GetAllMealsFailuer());
        rethrow;
      }
    });
  }
}
