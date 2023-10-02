import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';

import 'custom_button.dart';

class SignupSuccessNotificationBodyContent extends StatelessWidget {
  const SignupSuccessNotificationBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(
            flex: 3,
          ),
          SvgPicture.asset('assets/images/Illustration.svg'),
          const SizedBox(
            height: 10,
          ),
          SvgPicture.asset('assets/images/congrate.svg'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Your Profile Is Ready To Use',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const Spacer(
            flex: 3,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kVertificationCodeScrean),
            child: const CustomButton(
              title: 'Try Order',
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
