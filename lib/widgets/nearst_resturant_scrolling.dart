import 'package:flutter/material.dart';
import 'package:food_delivery_app/constans/constans.dart';

import '../my_meals/meals.dart';
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
  final List<MyMeals> allMeals;
  const PopularMenuCardsScrolling({super.key, required this.allMeals});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.31,
      width: double.infinity,
      child: allMeals.isEmpty
          ? const Center(
              child: Text(
                'Sorry we are work on our meals',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              physics: ScrollPhysics(),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(top: 35, left: 5, bottom: 10),
              itemCount: allMeals.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, kMealDetailScrean,
                        arguments: allMeals[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ContentResturantCard(
                      jpg: 'assets/images/spacy and creepjpg.jpg',
                      title: allMeals[index].name,
                      subtitle: '${allMeals[index].price} \$',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
