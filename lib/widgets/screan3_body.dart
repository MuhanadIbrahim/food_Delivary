import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';

import '../constans/constans.dart';

class Screan3Body extends StatelessWidget {
  const Screan3Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            SvgPicture.asset('assets/images/svgScrean3.svg'),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                SvgPicture.asset('assets/images/textScrean3.svg'),
                const SizedBox(
                  height: 25,
                ),
                SvgPicture.asset('assets/images/Sub Tittle Screan3.svg'),
              ],
            ),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, kLoginScrean),
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
