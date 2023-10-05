import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constans/constans.dart';
import 'custom_button.dart';

class SignUpBodyContent extends StatelessWidget {
  const SignUpBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, left: 10, top: 50, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/AppLogo1.jpg'),
          const Text(
            'Sign Up For Free',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0x115a6cea),
                    spreadRadius: 25,
                    blurRadius: 50)
              ],
            ),
            width: MediaQuery.of(context).size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  hintText: 'Your Name',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0x115a6cea),
                    spreadRadius: 25,
                    blurRadius: 50)
              ],
            ),
            width: MediaQuery.of(context).size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0x115a6cea),
                    spreadRadius: 25,
                    blurRadius: 50)
              ],
            ),
            width: MediaQuery.of(context).size.width - 40,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 2, color: Colors.grey)),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                  radius: 8,
                  backgroundColor: const Color(0xff14be77),
                  child: SvgPicture.asset('assets/images/checksvg.svg')),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Keep Me Signed In',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                  backgroundColor: const Color(0xff14be77),
                  radius: 8,
                  child: SvgPicture.asset('assets/images/checksvg.svg')),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Email Me About Special Pricing',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kSignUpProcess),
            child: const CustomButton(title: 'Create Account'),
          ),
          GestureDetector(
            onTap:() => Navigator.pushNamed(context, kLoginScrean),
            child: SvgPicture.asset('assets/images/Create Accalready have account.svg')),
        ],
      ),
    );
  }
}
