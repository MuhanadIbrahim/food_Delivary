import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/search_textfiled.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/sign_in/bloc/sign_in_bloc.dart';
import '../constans/constans.dart';

Widget findYourFood(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 30.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Find Your \nFavorite Food',
              style: TextStyle(
                color: Color(0xFF09041B),
                fontSize: 23.sp,
                fontFamily: 'BentonSans Bold',
                fontWeight: FontWeight.bold,
              ),
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
                  size: 40.sp,
                  color: const Color(0xff14be77),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, kSearchPageScrean);
          
        },
        child: Row(
          children: [
            const SearchTextFiled(),
            SizedBox(
              width: 10.w,
            ),
            Container(
              width: 48.w,
              height: 35.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFfef5ec),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(2.0.w),
                child: SvgPicture.asset(
                  'assets/images/FilterIcon.svg',
                  width: 35.w,
                  height: 35.h,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
