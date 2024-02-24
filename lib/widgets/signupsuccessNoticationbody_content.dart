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
            'Your Meals Is Ready To Go',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const Spacer(
            flex: 3,
          ),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, kHomeScrean),
            child: const CustomButton(
              title: 'Try Order Again',
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
