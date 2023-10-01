import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/borderless_box_decoration.dart';

import '../constans/constans.dart';
import 'custom_button.dart';

class SignUpProcessBodyContent extends StatelessWidget {
  const SignUpProcessBodyContent({
    super.key,
  });

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
            'Fill in your bio to get \nStarted',
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
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: Color(0xffffffff))),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Color(0xffffffff),
                  ), // Border color
                ),
                hintText: 'First Name',
                hintStyle: const TextStyle(
                    color: Colors.grey), // Color of the hint text
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: borderLessBoxDecoration(),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: Color(0xffffffff))),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Color(0xffffffff),
                  ), // Border color
                ),
                hintText: 'Last Name',
                hintStyle: const TextStyle(
                    color: Colors.grey), // Color of the hint text
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: borderLessBoxDecoration(),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: Color(0xffffffff))),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                  borderSide: BorderSide(
                    color: Color(0xffffffff),
                  ), // Border color
                ),
                hintText: 'Mobile Number',
                hintStyle: const TextStyle(
                    color: Colors.grey), // Color of the hint text
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kPaymentMethod),
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
