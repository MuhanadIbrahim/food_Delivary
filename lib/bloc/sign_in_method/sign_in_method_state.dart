part of 'sign_in_method_bloc.dart';

sealed class SignInMethodState extends Equatable {
  const SignInMethodState();

  @override
  List<Object> get props => [];
}

final class SignInMethodInitial extends SignInMethodState {}

final class SignInMethodEmailPassword extends SignInMethodState {}

final class SignInMethodGoogle extends SignInMethodState {
  final String userName;
  final String imageUrl;

  SignInMethodGoogle({required this.userName, required this.imageUrl});
}

final class SignInMethodFacebook extends SignInMethodState {
  final String userName;
  final String imageUrl;

  SignInMethodFacebook({required this.userName, required this.imageUrl});

  List<Object> get props => [userName, imageUrl];
}

final class SignInMethodFailed extends SignInMethodState {}
