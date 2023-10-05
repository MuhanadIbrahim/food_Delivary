import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/search_textfiled.dart';

Widget findYourFood(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            const Text(
              'Find Your \nFavorite Food',
              style: TextStyle(
                color: Color(0xFF09041B),
                fontSize: 31,
                fontFamily: 'BentonSans Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFDFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x33134D5A),
                    blurRadius: 50,
                    offset: Offset(11, 28),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Icon(
                Icons.notifications_none,
                size: 40,
                color: Color(0xff14be77),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SearchTextFiled(),
            Container(
              width: 49,
              height: 50,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9A84D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: SvgPicture.asset('assets/images/FilterIcon.svg'),
            ),
          ],
        )
      ],
    ),
  );
}