import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';
import 'package:food_delivery_app/widgets/testimonials.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'icon_button_resturant_screan.dart';
import 'info_resturant_for_resturantscrean.dart';
import 'nearst_resturant_scrolling.dart';

class MyCustomWidgetUsingFetchedData extends StatefulWidget {
  final MyRestaurant restaurant;
  final List<MyMeals> allMeals;

  MyCustomWidgetUsingFetchedData({
    super.key,
    required this.restaurant,
    required this.allMeals,
  });

  @override
  State<MyCustomWidgetUsingFetchedData> createState() =>
      _MyCustomWidgetUsingFetchedDataState();
}

class _MyCustomWidgetUsingFetchedDataState
    extends State<MyCustomWidgetUsingFetchedData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.99,
      width: MediaQuery.of(context).size.width * 0.99,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              const IconButtonsOfResurantScrean(),
              const SizedBox(
                height: 25,
              ),
              CachedNetworkImage(
                imageUrl: widget.restaurant.picture.toString(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              InfoForTheResturant(
                titleResturant: widget.restaurant.name,
                bioOfResurant: widget.restaurant.description,
                distanc: 19,
                rating: 4.8,
              ),
              const SizedBox(
                height: 25,
              ),
              const TextOfPopluarMenuAndTextOfViewMore(),
              const SizedBox(
                height: 25,
              ),
              PopularMenuCardsScrolling(
                restaurant: widget.restaurant,
                allMeals: widget.allMeals,
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
