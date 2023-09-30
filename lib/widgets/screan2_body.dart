import 'package:flutter/material.dart';

import '../constans/constans.dart';
import 'custom_button.dart';

class Screan2Body extends StatelessWidget {
  const Screan2Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/imageScrean2.jpg'),
            Image.asset('assets/images/Textscrean2.jpg'),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, kScrean3);
                },
                child: const CustomButton(title: 'Next')),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
