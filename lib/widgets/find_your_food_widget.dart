import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/search_textfiled.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/sign_in/bloc/sign_in_bloc.dart';
import '../constans/constans.dart';

Widget findYourFood(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 50,
      ),
      Row(
        children: [
          Text(
            'Find Your \nFavorite Food',
            style: TextStyle(
              color: Color(0xFF09041B),
              fontSize: 28 * MediaQuery.of(context).textScaleFactor,
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 0.33 * MediaQuery.of(context).size.width,
          ),
          GestureDetector(
            onTap: () async {
              context.read<SignInBloc>().add(const SignOutRequired());
              Navigator.pushReplacementNamed(context, kLoginScrean);
            },
            child: Container(
              width: 0.09 * MediaQuery.of(context).size.shortestSide,
              height: 0.09 * MediaQuery.of(context).size.shortestSide,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFDFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x33134D5A),
                    blurRadius: MediaQuery.of(context).size.width > 600
                        ? 50
                        : 25, // Adjust blur based on screen width
                    offset: Offset(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.height *
                            0.05), // Scale offset proportionally
                    spreadRadius: MediaQuery.of(context).size.width > 800
                        ? 5
                        : 0, // Optional spread adjustment
                  )
                ],
              ),
              child: Icon(
                Icons.notifications_none,
                size: 50 * MediaQuery.of(context).textScaleFactor,
                color: const Color(0xff14be77),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 0.009 * MediaQuery.of(context).size.height,
      ),
      Row(
        children: [
          const SearchTextFiled(),
          SizedBox(
            width: 0.039 * MediaQuery.of(context).size.width,
          ),
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0xFFfef5ec),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/images/FilterIcon.svg',
                height: 20,
                width: 20,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
