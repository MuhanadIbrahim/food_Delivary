
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/verticationcodebody_content.dart';


class VertificationCodeBody extends StatelessWidget {
  const VertificationCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SvgPicture.asset('assets/images/backGroundApp.svg'),const VertificationCodeBodyContent()],
      ),
    );
  }
}