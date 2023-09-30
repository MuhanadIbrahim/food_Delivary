import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UploadBodyContent extends StatelessWidget {
  const UploadBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/images/Icon Back.svg'),
        const Text(
          'Upload Your Photo\nProfile',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Text(
            'This data will be displayed in your account \nprofile for security'),
      ],
    );
  }
}
