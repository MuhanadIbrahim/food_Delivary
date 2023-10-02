import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'borderless_box_decoration.dart';
import 'custom_button.dart';

class ForgetPasswordBodyContent extends StatelessWidget {
  const ForgetPasswordBodyContent({super.key});

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
            flex: 2,
          ),
          const Text(
            'Forgot password?',
            style: TextStyle(
              color: Color(0xFF09041B),
              fontSize: 30,
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.bold,
              height: 0.05,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Select which contact details should we \nuse to reset your password',
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 130,
            decoration: borderLessBoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset('assets/images/MessageIcon.svg'),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Via sms:',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 16,
                        fontFamily: 'BentonSans Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '4235',
                            style: TextStyle(
                              color: Color(0xFF09051C),
                              fontSize: 20,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 130,
            decoration: borderLessBoxDecoration(),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset('assets/images/EmailIcon.svg'),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Via email:',
                      style: TextStyle(
                        color: Color(0xFF828282),
                        fontSize: 16,
                        fontFamily: 'BentonSans Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: ShapeDecoration(
                              color: Color(0xFF09051C),
                              shape: OvalBorder(),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '@gmail.com',
                            style: TextStyle(
                              color: Color(0xFF09051C),
                              fontSize: 20,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Spacer(
            flex: 1,
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
