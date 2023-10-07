import 'package:flutter/material.dart';

class LocationAndRatingResturantScrean extends StatelessWidget {
  const LocationAndRatingResturantScrean({
    super.key, required this.distanc, required this.rating,
  });
  final double distanc;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Row(children: [
            const Icon(
              Icons.location_on,
              color: Color(0xff2ecf80),
            ),
            Opacity(
              opacity: 0.30,
              child: Text(
                '$distanc Km',
                style: const TextStyle(
                  color: Color(0xFF3B3B3B),
                  fontSize: 15,
                  fontFamily: 'BentonSans Regular',
                  fontWeight: FontWeight.w400,
                  height: 0,
                  letterSpacing: 0.50,
                ),
              ),
            ),
           const  SizedBox(
              width: 25,
            ),
            Container(
              child: Row(children: [
               const  Icon(
                  Icons.star_half,
                  color: Color(0xff2ecf80),
                ),
                Opacity(
                  opacity: 0.30,
                  child: Text(
                    '$rating Rating',
                    style:const  TextStyle(
                      color: Color(0xFF3B3B3B),
                      fontSize: 15,
                      fontFamily: 'BentonSans Regular',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
              ]),
            )
          ]),
        )
      ],
    );
  }
}
