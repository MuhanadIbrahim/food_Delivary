import 'package:flutter/material.dart';

import 'content_card.dart';

class NearstResturantCardsScrolling extends StatelessWidget {
  const NearstResturantCardsScrolling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 35, left: 5, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContentResturantCard(
            jpg: 'assets/images/LogoVeganLoverResturantjpg.jpg',
            title: 'Vegan Rsto',
            subtitle: '12 Mins',
          ),
          SizedBox(
            width: 20,
          ),
          ContentResturantCard(
              jpg: 'assets/images/logoHealthyOrganicProducrResturantjpg.jpg',
              title: 'Healthy Food',
              subtitle: ' 8 Mins'),
          SizedBox(
            width: 20,
          ),
          ContentResturantCard(
              jpg: 'assets/images/logoGoodFoodResturantjpg.jpg',
              title: 'Good Food',
              subtitle: ' 12 Mins')
        ],
      ),
    );
  }
}
