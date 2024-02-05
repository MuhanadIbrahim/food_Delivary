import 'package:flutter/material.dart';
import 'package:food_delivery_app/my_meals/meals.dart';

import '../widgets/icon_button_resturant_screan.dart';
import '../widgets/info_resturant_for_resturantscrean.dart';
import '../widgets/testimonials.dart';
import '../widgets/textof_nears_restrunt_viewmore.dart';

class MealDetailScrean extends StatelessWidget {
  const MealDetailScrean({super.key});
 // MyMeals theMeal;
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
              // InfoForTheResturant(
              //   titleResturant: restaurant.name,
              //   bioOfResurant:
              //       'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
              //   distanc: 19,
              //   rating: 4.8,
              // ),
              const SizedBox(
                height: 25,
              ),
              const TextOfPopluarMenuAndTextOfViewMore(),
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
