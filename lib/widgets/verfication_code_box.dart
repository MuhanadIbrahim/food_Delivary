
import 'package:flutter/material.dart';

import 'borderless_box_decoration.dart';

class VerficationCodeBox extends StatelessWidget {
  const VerficationCodeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
