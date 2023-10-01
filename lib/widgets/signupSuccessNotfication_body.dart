
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/signupsuccessNoticationbody_content.dart';

import '../views/signup_success_notication_screan.dart';

class SignUpSuccessNotifcationBody extends StatelessWidget {
  const SignUpSuccessNotifcationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/backGroundApp.svg'),
          SignupSuccessNotificationBodyContent()
        ],
      ),
    );
  }
}