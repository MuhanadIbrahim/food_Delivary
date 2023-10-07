import 'package:flutter/material.dart';

import 'location_rating_restruant.dart';

class InfoForTheResturant extends StatelessWidget {
  const InfoForTheResturant({
    super.key,
    required this.titleResturant,
    required this.bioOfResurant,
    required this.distanc,
    required this.rating,
  });
  final String titleResturant;
  final String bioOfResurant;
  final double distanc;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            titleResturant,
            style: TextStyle(
              color: Color(0xFF09051C),
              fontSize: 30,
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          LocationAndRatingResturantScrean(distanc: distanc, rating: rating),
          SizedBox(
            height: 25,
          ),
          Text(
            bioOfResurant,
          ),
        ],
      ),
    );
  }
}