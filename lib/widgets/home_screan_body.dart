import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';

import 'home_screan_body_content.dart';

class HomeScreanBody extends StatefulWidget {
  const HomeScreanBody({super.key});

  @override
  State<HomeScreanBody> createState() => _HomeScreanBodyState();
}

class _HomeScreanBodyState extends State<HomeScreanBody> {
  @override
  // void initState() {
  //   context.read<GetAllRestaurantBloc>().add(GetAllRestaurantEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/backGroundApp.svg'),
          const HomeScreanBodyContent()
        ],
      ),
    );
  }
}
