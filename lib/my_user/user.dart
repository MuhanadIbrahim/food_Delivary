import 'package:equatable/equatable.dart';

import 'user_entity.dart';

class MyUser extends Equatable {
  final String name;
  final int phoneNumber;
  final String email;
  String? picture;
  final String id;

  MyUser(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      this.picture});

  static final empty =
      MyUser(id: '', name: '', phoneNumber: 0, email: '', picture: '');

  MyUser copyWith(
      {String? name,
      int? phoneNumber,
      String? email,
      String? picture,
      String? id}) {
    return MyUser(
        id: id ?? this.id,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        picture: picture ?? this.picture);
  }

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        id: id,
        picture: picture);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        id: entity.id,
        name: entity.name,
        phoneNumber: entity.phoneNumber,
        email: entity.email,
        picture: entity.picture);
  }

  @override
  List<Object?> get props => [id, name, phoneNumber, email, picture];
}
