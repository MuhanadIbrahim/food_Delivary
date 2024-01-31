import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/get_all_meals/get_all_meals_bloc.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';
import 'package:food_delivery_app/widgets/testimonials.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';

import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import 'icon_button_resturant_screan.dart';
import 'info_resturant_for_resturantscrean.dart';
import 'myCustomWidgetUsingFetchedData.dart';
import 'nearst_resturant_scrolling.dart';

class ResturantScreanBody extends StatefulWidget {
  const ResturantScreanBody({Key? key}) : super(key: key);

  @override
  State<ResturantScreanBody> createState() => _ResturantScreanBodyState();
}

class _ResturantScreanBodyState extends State<ResturantScreanBody> {
  MyRestaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocBuilder<MealRequiredRestaurantBloc, MealRequiredRestaurantState>(
        builder: (context, state) {
          if (state is MealRequiredRestaurantLoading) {
            // Show a loading indicator or any other UI for loading state
            return const Center(child: CircularProgressIndicator());
          } else if (state is MealRequiredRestaurantISuccess) {
            // Update the UI with the fetched data
            restaurant = state.restaurant;
            return MyCustomWidgetUsingFetchedData(
              allMeals: state.allMeals,
              restaurant: state.restaurant,
            );
          } else if (state is MealRequiredRestaurantFailed) {
            // Handle the failure state
            return Text('Failed to fetch data.');
          } else {
            // Default or initial state
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Photo Restaurantjpg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

// class ShowModelBottomSheet extends StatelessWidget {
//   const ShowModelBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetAllMealsBloc(),
//       child: ShowModelBottomSheetBody(),
//     );
//   }
// }

// class ShowModelBottomSheetBody extends StatelessWidget {
//   const ShowModelBottomSheetBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetAllMealsBloc, GetAllMealsState>(
//       builder: (context, state) {
//         if (state is MealOfRequiredRestaurant) {
//           return FutureBuilder(
//             future: showModalBottomSheet(
//               context: context,
//               isScrollControlled: true,
//               backgroundColor: Colors.transparent,
//               builder: (context) => Container(
//                 height: MediaQuery.of(context).size.height * 0.75,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40.0),
//                     topRight: Radius.circular(40.0),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         const IconButtonsOfResurantScrean(),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         InfoForTheResturant(
//                           titleResturant: '${state.restaurant.name} restaurant',
//                           bioOfResurant:
//                               'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
//                           distanc: 19,
//                           rating: 4.8,
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         const TextOfPopluarMenuAndTextOfViewMore(),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         const PopularMenuCardsScrolling(),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         const Text(
//                           'Testimonials',
//                           style: TextStyle(
//                             color: Color(0xFF09041B),
//                             fontSize: 18,
//                             fontFamily: 'BentonSans Bold',
//                             fontWeight: FontWeight.bold,
//                             height: 0.09,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 25,
//                         ),
//                         ListView.builder(
//                           physics: const ScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: 5,
//                           itemBuilder: (BuildContext context, int index) {
//                             return const Testimonials();
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//               if (snapshot.hasData) {
//                 return snapshot.data;
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
