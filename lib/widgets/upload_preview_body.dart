import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/widgets/uploadpreview_body_content.dart';

class UploadPreviewBody extends StatelessWidget {
  const UploadPreviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SvgPicture.asset('assets/images/backGroundApp.svg'),const UploadPreviewBodyContent()],
      ),
    );
  }
}
