import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_add_to_cart_button/flutter_add_to_cart_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';
import 'package:food_delivery_app/bloc/basket/basket_event.dart';
import 'package:food_delivery_app/my_meals/meals.dart';

import '../widgets/icon_button_resturant_screan.dart';
import '../widgets/info_resturant_for_resturantscrean.dart';
import '../widgets/testimonials.dart';

class MealDetailScrean extends StatefulWidget {
  const MealDetailScrean({super.key});

  @override
  State<MealDetailScrean> createState() => _MealDetailScreanState();
}

class _MealDetailScreanState extends State<MealDetailScrean> {
  // MyMeals theMeal;
  AddToCartButtonStateId stateId = AddToCartButtonStateId.idle;

  @override
  Widget build(BuildContext context) {
    final MyMeals meal = ModalRoute.of(context)!.settings.arguments as MyMeals;
    return BlocProvider(
      create: (context) => BasketBloc(),
      child: Scaffold(
        body: Container(
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
                    titleResturant: meal.name,
                    bioOfResurant: meal.description,
                    distanc: 19,
                    rating: 4.8,
                  ),
                  const SizedBox(
                    height: 25,
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
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: AddToCartButton(
                        trolley: Image.asset(
                          'assets/images/ic_cart.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                        ),
                        text: Text(
                          'Add to cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        check: SizedBox(
                          width: 48,
                          height: 48,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(24),
                        backgroundColor: Colors.greenAccent,
                        onPressed: (id) {
                          if (id == AddToCartButtonStateId.idle) {
                         
                            context
                                .read<BasketBloc>()
                                .add(BasketEventAdd(meal: meal));
                            HapticFeedback.heavyImpact();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Your meal have been added successfully.'),
                              ),
                            );
                            //handle logic when pressed on idle state button.
                            setState(() {
                              stateId = AddToCartButtonStateId.loading;
                              Future.delayed(Duration(seconds: 3), () {
                                setState(() {
                                  stateId = AddToCartButtonStateId.done;
                                });
                              });
                            });
                          } else if (id == AddToCartButtonStateId.done) {
                            //handle logic when pressed on done state button.
                            setState(() {
                              stateId = AddToCartButtonStateId.idle;
                            });
                          }
                        },
                        stateId: stateId,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
