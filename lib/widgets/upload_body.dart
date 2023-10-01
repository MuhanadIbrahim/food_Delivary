import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/upload_body_content.dart';

class UploadScreanBody extends StatelessWidget {
  const UploadScreanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SvgPicture.asset('assets/images/backGroundApp.svg'),
        UploadBodyContent()
      ]),
    );
  }
}
