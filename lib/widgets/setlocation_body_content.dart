import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/borderless_box_decoration.dart';

import 'custom_button.dart';

class SetlocationBodyContent extends StatelessWidget {
  const SetlocationBodyContent({super.key});

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
            height: 130,
            decoration: borderLessBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 17,
                        child:
                            SvgPicture.asset('assets/images/pinLocation.svg'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Your Location',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xfff6f6f6),
                    ),
                    child: Center(
                        child: Text(
                      'Set Location',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          GestureDetector(
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
