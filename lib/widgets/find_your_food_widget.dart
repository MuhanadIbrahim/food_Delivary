import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/search_textfiled.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constans/constans.dart';

Widget findYourFood(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
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
            width: 80,
          ),
          GestureDetector(
            onTap: () async {
              try {
                await GoogleSignIn().disconnect();
                print('=================user Google   Sign Out !');
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, kLoginScrean);
              } catch (e) {
                print('failed to disconnect on signout $e');
              }
              try {
                await FacebookAuth.instance.logOut();
                await FirebaseAuth.instance.signOut();
              } catch (e) {
                print(e);
              }
              print('not work ');

              if (FirebaseAuth.instance.currentUser != null) {
                await FirebaseAuth.instance.signOut();
                print('=================user firebase  Sign Out !');
                // ignore: use_build_context_synchronously
                Navigator.pushReplacementNamed(context, kLoginScrean);
              }




            },
            child: Container(
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
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        children: [
          const SearchTextFiled(),
          SizedBox(
            width: 20,
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
