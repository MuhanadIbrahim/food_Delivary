import 'package:flutter/material.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';
import 'package:food_delivery_app/widgets/testimonials.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';

import 'icon_button_resturant_screan.dart';
import 'info_resturant_for_resturantscrean.dart';
import 'nearst_resturant_scrolling.dart';

class MyCustomWidgetUsingFetchedData extends StatelessWidget {
  final MyRestaurant restaurant;
  final List<MyMeals> allMeals;
  const MyCustomWidgetUsingFetchedData({
    super.key,
    required this.restaurant,
    required this.allMeals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.99,
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
              InfoForTheResturant(
                titleResturant: restaurant.name,
                bioOfResurant: restaurant.description,
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
                allMeals: allMeals,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Testimonials',
                style: TextStyle(
                  color: Color(0xFF09041B),
                  fontSize: 18,
                  fontFamily: 'BentonSans Bold',
                  fontWeight: FontWeight.bold,
                  height: 0.09,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const Testimonials();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
