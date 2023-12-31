import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/testimonials.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';

import 'icon_button_resturant_screan.dart';
import 'info_resturant_for_resturantscrean.dart';
import 'nearst_resturant_scrolling.dart';

class ResturantScreanBody extends StatelessWidget {
  const ResturantScreanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        label: const Row(
          children: [
            Icon(
              Icons.menu_book,
            ),
            Text('  Menu')
          ],
        ),
        onPressed: () => _showModalBottomSheet(context),
      ),
      body: Builder(
        builder: (BuildContext context) {
          Future.delayed(Duration.zero, () => _showModalBottomSheet(context));
          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Photo Restaurantjpg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
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
                const InfoForTheResturant(
                  titleResturant: 'Wijie Bar and Resto',
                  bioOfResurant:
                      'Most whole Alaskan Red King Crabs get broken down into legs, claws, and lump meat. We offer all of these options as well in our online shop, but there is nothing like getting the whole . . . .',
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
                const PopularMenuCardsScrolling(),
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
                  height: 25,
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
      ),
    );
  }
}
