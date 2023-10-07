
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/popular_name_button.dart';

import 'location_button.dart';

class IconButtonsOfResurantScrean extends StatelessWidget {
  const IconButtonsOfResurantScrean({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PopularButton(),
        SizedBox(
          width: 80,
        ),
        LocationButton(),
        FavoriteButton()
      ],
    );
  }
}
