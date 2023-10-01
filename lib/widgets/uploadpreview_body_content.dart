import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';

import 'custom_button.dart';

class UploadPreviewBodyContent extends StatelessWidget {
  const UploadPreviewBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 2,
          ),
          SvgPicture.asset('assets/images/Icon Back.svg'),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'Upload Your Photo\nProfile',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 1,
          ),
          const Text(
              'This data will be displayed in your account \nprofile for security'),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/profilepic.jpg'),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/images/Close Icon.svg'),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kSetLocationScrean),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: CustomButton(title: 'Next'),
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
