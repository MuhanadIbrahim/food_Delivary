import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/my_user/user_repository.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        var x = await _userRepository.signIn(event.email, event.password);
        if (x) {
          emit(SignInSuccess());
        } else {
          emit(SignInFailure());
        }
      } catch (e) {
        log(e.toString());
        emit(const SignInFailure());
      }
    });
    on<SignOutRequired>(
      (event, emit) async {
        await _userRepository.logOut();
      },
    );
  }
}
