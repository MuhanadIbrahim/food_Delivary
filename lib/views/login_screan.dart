import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:food_delivery_app/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';

import '../bloc/my_user_bloc/my_user_bloc.dart';
import '../bloc/sign_in/bloc/sign_in_bloc.dart';
import '../bloc/update_user_info_bloc/update_user_info_bloc.dart';
import '../widgets/Login_screan_body.dart';

class LoginScrean extends StatelessWidget {
  const LoginScrean({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
        BlocProvider(
          create: (context) => UpdateUserInfoBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
        BlocProvider(
          create: (context) => MyUserBloc(
              myUserRepository:
                  context.read<AuthenticationBloc>().userRepository)
            ..add(GetMyUser(
                myUserId: context.read<AuthenticationBloc>().state.user!.uid)),
        ),
        BlocProvider(
          create: (context) => GetAllRestaurantBloc(),
        )
      ],
      child: const LoginScreanBody(),
    );
  }
}
