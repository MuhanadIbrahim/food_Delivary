
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constans/constans.dart';
import 'Custom_TextFormField_sign_in.dart';
import 'custom_button.dart';

class LoginScreanBodyContent extends StatelessWidget {
  const LoginScreanBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset('assets/images/AppLogo1.jpg'),
          SvgPicture.asset(
              'assets/images/login to your account login screan.svg'),
          const CustomTextFormFieldForEmail(),
          const CustomTextFormFieldForPassword(),
          SvgPicture.asset('assets/images/or continue LoginScrean.svg'),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    'assets/images/Facebook Button.svg',
                    width: 80,
                    height: 125,
                    fit: BoxFit.contain,
                  ),
                  SvgPicture.asset(
                    'assets/images/Google Button.svg',
                    width: 80,
                    height: 125,
                  ),
                ],
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width / 3,
                  bottom: MediaQuery.of(context).size.height / 25,
                  child: SvgPicture.asset(
                      'assets/images/Forgot Password Link.svg')),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kSignUpScrean),
            child: const CustomButton(title: 'Login'),
          ),
        ],
      ),
    );
  }
}
