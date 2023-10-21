import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class User extends Equatable {
  final String name;
  final int phoneNumber;
  final String email;
  final String? picture;
  final String id;

  const User(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      this.picture});

  static const empty = User(id: '', name: '', phoneNumber: 0, email: '');

  User copyWith(
      {String? name,
      int? phoneNumber,
      String? email,
      String? picture,
      String? id}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email);
  }

  bool get isEmpty => this == User.empty;

  bool get isNotEmpty => this != User.empty;

  UserEntity toEntity() {
    return UserEntity(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        id: id,
        picture: picture);
  }

  User fromEntity(UserEntity entity) {
    return User(
        id: entity.id,
        name: entity.name,
        phoneNumber: entity.phoneNumber,
        email: entity.email,
        picture: entity.picture);
  }

  @override
  
  List<Object?> get props => [id, name, phoneNumber, email, picture];
}
