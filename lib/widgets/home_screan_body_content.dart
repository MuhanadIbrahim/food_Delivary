import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/borderless_box_decoration.dart';
import 'package:food_delivery_app/widgets/gradient_icon.dart';
import 'package:food_delivery_app/widgets/special_deal_promo.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';

import 'content_card.dart';
import 'decoration_resturant_card.dart';
import 'find_your_food_widget.dart';
import 'home_button_icon.dart';
import 'menu_details_price_card.dart';
import 'nearst_resturant_scrolling.dart';

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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: borderLessBoxDecoration(),
              height: 65,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeButtonIcon(),
                    GradientIcon(
                        size: 40,
                        icon: Icons.person,
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xff9ae5bf), Color(0xffd7f6e6)])),
                    GradientIcon(
                        size: 40,
                        icon: Icons.shopping_cart,
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xff9ae5bf), Color(0xffd7f6e6)])),
                    GradientIcon(
                        size: 40,
                        icon: Icons.wechat,
                        gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [Color(0xff9ae5bf), Color(0xffd7f6e6)]))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
