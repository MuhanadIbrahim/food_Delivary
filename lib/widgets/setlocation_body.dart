
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/setlocation_body_content.dart';

import '../views/set_location_screan.dart';

class SetlocationBody extends StatelessWidget {
  const SetlocationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [SvgPicture.asset('assets/images/backGroundApp.svg'),SetlocationBodyContent()],
      ),
    );
  }
}