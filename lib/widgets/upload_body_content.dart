import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          Spacer(
            flex: 2,
          ),
          SvgPicture.asset('assets/images/Icon Back.svg'),
          Spacer(
            flex: 1,
          ),
          const Text(
            'Upload Your Photo\nProfile',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 1,
          ),
          const Text(
              'This data will be displayed in your account \nprofile for security'),
          Spacer(
            flex: 1,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border.all(
                color: Color(0xffffffff),
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0x115a6cea),
                    spreadRadius: 25,
                    blurRadius: 25)
              ],
            ),
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
                    Text(
                      'From Gallery',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border.all(
                color: Color(0xffffffff),
              ),
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0x115a6cea),
                    spreadRadius: 25,
                    blurRadius: 25)
              ],
            ),
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
                    Text(
                      ' Take Photo',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
          ),
          Spacer(
            flex: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100.0),
            child: CustomButton(title: 'Next'),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
