import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constans/constans.dart';

import 'borderless_box_decoration.dart';
import 'custom_button.dart';

class UploadBodyContent extends StatelessWidget {
  const UploadBodyContent({super.key});

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
          Container(
            decoration: borderLessBoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/GalleryIcon.svg',
                      height: 60,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'From Gallery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            decoration: borderLessBoxDecoration(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/cameraIcon.svg',
                      height: 60,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      ' Take Photo',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, kUploadPreview),
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
