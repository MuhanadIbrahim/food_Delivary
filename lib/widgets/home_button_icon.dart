
import 'package:flutter/material.dart';

import 'gradient_icon.dart';

class HomeButtonIcon extends StatelessWidget {
  const HomeButtonIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 44,
      decoration: ShapeDecoration(
        gradient:const  LinearGradient(
          begin: Alignment(0.99, -0.15),
          end: Alignment(-0.99, 0.15),
          colors: [Color(0xFFecfcf2), Color(0xFFe8f9f1)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GradientIcon(
            size: 37,
            icon: Icons.home,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff48dd89), Color(0xff1cc37a)],
            ),
          ),
          Text(
            'Home',
            style: TextStyle(
                color: Color(0xFF09051C),
                fontSize: 15,
                fontFamily: 'BentonSans Medium',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }
}
