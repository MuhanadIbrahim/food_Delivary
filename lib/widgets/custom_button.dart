
import 'package:flutter/material.dart';

import 'custom_BoxDecoration.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ctabuttonmpj (182:752)

      width: 200,
      height: 80,
      decoration: customBoxDecoration(),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
    );
  }

 
}

