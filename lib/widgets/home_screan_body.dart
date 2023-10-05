
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_screan_body_content.dart';

class HomeScreanBody extends StatelessWidget {
  const HomeScreanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SvgPicture.asset('assets/images/backGroundApp.svg'),const HomeScreanBodyContent()],
      ),
    );
  }
}