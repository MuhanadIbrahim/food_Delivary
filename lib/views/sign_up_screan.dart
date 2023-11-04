import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';

import '../bloc/sign_up/bloc/sign_up_bloc.dart';
import '../widgets/SignUp_Screan_Body.dart';

class SignUpScrean extends StatelessWidget {
  const SignUpScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(
          userRepository: context.read<AuthenticationBloc>().userRepository),
      child: const SignUpScreanBody(),
    );
  }
}
