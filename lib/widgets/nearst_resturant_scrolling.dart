import 'package:flutter/material.dart';

import 'content_card.dart';

class NearstResturantCardsScrolling extends StatelessWidget {
  const NearstResturantCardsScrolling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: ScrollPhysics(),
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

class PopularMenuCardsScrolling extends StatelessWidget {
  const PopularMenuCardsScrolling({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: ScrollPhysics(),
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(top: 35, left: 5, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ContentResturantCard(
            jpg: 'assets/images/spacy and creepjpg.jpg',
            title: 'Spacy fresh crab',
            subtitle: '16 \$',
          ),
          SizedBox(
            width: 20,
          ),
          ContentResturantCard(
              jpg: 'assets/images/spcy and creep 2 jpg.jpg',
              title: 'Spacy fresh crab',
              subtitle: ' 12 \$'),
          SizedBox(
            width: 20,
          ),
          ContentResturantCard(
              jpg: 'assets/images/spacy and creepjpg.jpg',
              title: 'Spacy fresh crab',
              subtitle: ' 13 \$')
        ],
      ),
    );
  }
}
