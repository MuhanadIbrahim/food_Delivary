import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final int phoneNumber;
  final String email;
  final String? picture;
  final String id;

  const UserEntity(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      this.picture});

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'picture': picture
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
      id: doc['id'] as String,
      name: doc['name'] as String,
      phoneNumber: doc['phoneNumber'] as int,
      email: doc['email'] as String,
      picture: doc['picture'] as String?,
    );
  }

  @override
  String toString() {
    return '''UserEntity: {
        id: $id
        email: $email
        name: $name
        phoneNumber: $phoneNumber
        picture: $picture

      }''';
  }

  @override
  List<Object?> get props => [id, name, phoneNumber, email, picture];
}
