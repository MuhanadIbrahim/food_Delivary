import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';

import '../bloc/sign_in/bloc/sign_in_bloc.dart';
import '../widgets/Login_screan_body.dart';

class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      child: const LoginScreanBody(),
    );
  }
}
