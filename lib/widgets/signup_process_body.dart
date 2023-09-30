import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';

import 'SignUpProcessBodyContent.dart';

class SignUpProcessBody extends StatelessWidget {
  const SignUpProcessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryBackGroundColor,
      body: Stack(children: [
        Positioned(
          child: SvgPicture.asset('assets/images/backGroundApp.svg'),
        ),
        const Positioned(
          child: SignUpProcessBodyContent(),
        )
      ]),
    );
  }
}
