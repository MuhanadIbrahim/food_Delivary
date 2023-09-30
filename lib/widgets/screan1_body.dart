
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Screan1Body extends StatelessWidget {
  const Screan1Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: SvgPicture.asset('assets/images/backGroundApp.svg',
              width: double.infinity

              // Adjust height as needed
              ),
        ),
        Positioned(
            bottom: 350,
            left: MediaQuery.of(context).size.width / 4,
            child: Image.asset('assets/images/AppLogo1.jpg'))
      ],
    );
  }
}