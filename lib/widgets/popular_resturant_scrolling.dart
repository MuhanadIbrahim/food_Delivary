import 'package:flutter/material.dart';

import 'content_card.dart';

class PopularResutrantScrolling extends StatelessWidget {
  const PopularResutrantScrolling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return const ContentResturantCard(
            jpg: 'assets/images/logoHealthyOrganicProducrResturantjpg.jpg',
            title: 'Healthy Food',
            subtitle: '8 Mins');
      },
    );
  }
}