import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/my_restaurant/restaurant_entity.dart';

class MyRestaurant extends Equatable {
  final String name;
  final int phoneNumber;
  final String email;
  String? picture;
  final String id;
  final String description;

  MyRestaurant(
      {required this.description,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.id,
      this.picture});

  static final empty = MyRestaurant(
      id: '',
      name: '',
      phoneNumber: 0,
      email: '',
      picture: '',
      description: '');

  MyRestaurant copyWith(
      {String? name,
      int? phoneNumber,
      String? description,
      String? email,
      String? picture,
      String? id}) {
    return MyRestaurant(
        description: description ?? this.description,
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        picture: picture ?? this.picture);
  }

  bool get isEmpty => this == MyRestaurant.empty;

  bool get isNotEmpty => this != MyRestaurant.empty;

  factory MyRestaurant.fromMap(Object? object) {
    final data = object as Map<String, dynamic>;

    return MyRestaurant(
      description: object['description'] as String,
      id: object['id'] as String,
      name: object['name'] as String,
      phoneNumber: object['phoneNumber'] as int,
      email: object['email'] as String,
      picture: object['picture'] as String?,
    );
  }

  MyRestaurantEntity toEntity() {
    return MyRestaurantEntity(
        description: description,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        id: id,
        picture: picture);
  }

  static MyRestaurant fromEntity(MyRestaurantEntity entity) {
    return MyRestaurant(
        description: entity.description,
        id: entity.id,
        name: entity.name,
        phoneNumber: entity.phoneNumber,
        email: entity.email,
        picture: entity.picture);
  }

  // Future<void> addMeal(MyMeals meal) async {
  //       try {
  //           final CollectionReference mealsCollection = FirebaseFirestore.instance.collection('restaurants').doc(id).collection('meals');
  //           await mealsCollection.add({
  //               'name': meal.name,
  //               'available': meal.available,
  //               'price': meal.price,
  //               'description': meal.description,
  //               // ... other meal details
  //           });
  //       } catch (e) {
  //           // Handle errors here
  //           print('Error adding meal: $e');
  //       }
  //   }
  @override
  List<Object?> get props =>
      [description, name, phoneNumber, email, picture ?? ''];
}
