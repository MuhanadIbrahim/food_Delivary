import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'borderless_box_decoration.dart';
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
          Container(
            height: 130,
            decoration: borderLessBoxDecoration(),
            child: const Padding(
              padding: EdgeInsets.only(top: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '1',
                    style: TextStyle(
                      color: Color(0xFF09051C),
                      fontSize: 60,
                      fontFamily: 'BentonSans Medium',
                      fontWeight: FontWeight.bold,
                      height: 0.05,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '9',
                    style: TextStyle(
                      color: Color(0xFF09051C),
                      fontSize: 60,
                      fontFamily: 'BentonSans Medium',
                      fontWeight: FontWeight.bold,
                      height: 0.05,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      color: Color(0xFF09051C),
                      fontSize: 60,
                      fontFamily: 'BentonSans Medium',
                      fontWeight: FontWeight.bold,
                      height: 0.05,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                      color: Color(0xFF09051C),
                      fontSize: 60,
                      fontFamily: 'BentonSans Medium',
                      fontWeight: FontWeight.bold,
                      height: 0.05,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          GestureDetector(
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
