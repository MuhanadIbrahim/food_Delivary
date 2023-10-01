import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/widgets/borderless_box_decoration.dart';

import 'custom_button.dart';

class paymentMethodBodyContent extends StatelessWidget {
  const paymentMethodBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          SvgPicture.asset('assets/images/Icon Back.svg'),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Payment Method',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
              'This data will be displayed in your account \nprofile for security'),
          const SizedBox(
            height: 25,
          ),
          Container(
            decoration: borderLessBoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(
                  'assets/images/paypal-2 (1) 1.svg',
                  height: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: borderLessBoxDecoration(),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: SvgPicture.asset(
                'assets/images/visa (1) 1.svg',
                height: 70,
              ),
            )),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: borderLessBoxDecoration(),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'assets/images/Payoneer_logo 1.svg',
                height: 35,
              ),
            )),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kUplaodScrean),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: CustomButton(title: 'Next'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
