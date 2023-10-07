
import 'package:flutter/material.dart';

import 'borderless_box_decoration.dart';
import 'gradient_icon.dart';

class Testimonials extends StatelessWidget {
  const Testimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: borderLessBoxDecoration(),
      child: ListTile(
        isThreeLine: true,
        leading: Image.asset('assets/images/Photo Profilejpg.jpg'),
        title: const Text(
          'Dianne Russell',
          style: TextStyle(
            color: Color(0xFF09041B),
            fontSize: 17,
            fontFamily: 'BentonSans Medium',
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: const Text(
          'This Is great, So delicious! You Must Here, With Your family . . ',
        ),
        trailing: const RatingForTestimonials(),
      ),
    );
  }
}




class RatingForTestimonials extends StatelessWidget {
  const RatingForTestimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 44,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.99, -0.15),
          end: Alignment(-0.99, 0.15),
          colors: [Color(0xFFecfcf2), Color(0xFFe8f9f1)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientIcon(
            size: 30,
            icon: Icons.star,
            gradient: const LinearGradient(
              begin: Alignment(0.99, -0.15),
              end: Alignment(-0.99, 0.15),
              colors: <Color>[Color(0xff53e78b), Color(0xff14be77)],
            ),
          ),
          Text(
            '5',
            style: TextStyle(
                color: Color(0xFF53E78B),
                fontSize: 15,
                fontFamily: 'BentonSans Medium',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
