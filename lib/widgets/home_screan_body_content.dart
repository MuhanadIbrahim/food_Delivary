import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/content_card.dart';
import 'package:food_delivery_app/widgets/popular_resturant_scrolling.dart';
import 'package:food_delivery_app/widgets/special_deal_promo.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';

import 'find_your_food_widget.dart';
import 'menu_details_price_card.dart';
import 'nearst_resturant_scrolling.dart';
import 'custom_navigation_bar.dart';

class HomeScreanBodyContent extends StatelessWidget {
  const HomeScreanBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          findYourFood(context),
          Expanded(
            child: ListView(
              children: const [
                SpecialDealPromoHomeScrean(),
                SizedBox(
                  height: 20,
                ),
                TextOfNearstResAndTextOfViewMore(),
                SizedBox(
                  height: 20,
                ),
                NearstResturantCardsScrolling(),
                SizedBox(
                  height: 20,
                ),
                TextOfPopluarMenuAndTextOfViewMore(),
                SizedBox(
                  height: 20,
                ),
                MenuDetailsPriceCard(
                  jpg: 'assets/images/Green Nodejpg.jpg',
                  title: 'Green Noddle',
                  subtitle: 'Noodle Home',
                  price: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                MenuDetailsPriceCard(
                    jpg: 'assets/images/fruitSaladjpg.jpg',
                    title: 'Fruit Salad',
                    subtitle: 'Wijie Resto',
                    price: 5),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Popular Restaurant',
                  style: TextStyle(
                    color: Color(0xFF09041B),
                    fontSize: 18,
                    fontFamily: 'BentonSans Bold',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                PopularResutrantScrolling(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: CustomNavigationBar(),
          )
        ],
      ),
    );
  }
}


