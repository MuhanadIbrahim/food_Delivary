import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/widgets/verfication_code_box.dart';

import 'custom_button.dart';

class VertificationCodeBodyContent extends StatelessWidget {
  const VertificationCodeBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          SvgPicture.asset('assets/images/Icon Back.svg'),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Enter 4-digit\nVerification code',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'BentonSans Bold',
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Code send to +6282045**** . This code will \nexpired in 01:30',
          ),
          const Spacer(
            flex: 1,
          ),
          VerficationCodeBox(),
          const Spacer(
            flex: 8,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kForgetPasswordScrean),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: CustomButton(title: 'Next'),
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
