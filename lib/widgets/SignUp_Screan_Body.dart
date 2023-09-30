import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/widgets/signup_body_content.dart';


class SignUpScreanBody extends StatelessWidget {
  const SignUpScreanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryBackGroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 18,
            child: SvgPicture.asset('assets/images/backGroundApp.svg'),
          ),const SignUpBodyContent()
         
        ],
      ),
    );
  }
}
