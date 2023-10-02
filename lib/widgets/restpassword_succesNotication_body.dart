
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/widgets/restpassword_successn_notication_body_content.dart';


class RestpasswordSuccesNoticationBody extends StatelessWidget {
  const RestpasswordSuccesNoticationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [SvgPicture.asset('assets/images/backGroundApp.svg'),const RestpasswordSuccesNoticationBodyContent()],),);
  }
}