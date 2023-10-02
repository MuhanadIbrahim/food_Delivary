import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';

import 'custom_button.dart';

class RestPasswordBodyContent extends StatelessWidget {
  const RestPasswordBodyContent({super.key});

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
            'Reset your password \nhere',
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
            'Select which contact details should we \nuse to reset your password',
          ),
          const Spacer(
            flex: 1,
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
                  hintText: 'New Password',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          const Spacer(
            flex: 1,
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
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, kRestpasswordNoticationSuccess),
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
