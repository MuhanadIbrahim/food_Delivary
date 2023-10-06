
import 'package:flutter/material.dart';

import 'borderless_box_decoration.dart';
import 'gradient_icon.dart';
import 'home_button_icon.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderLessBoxDecoration(),
      height: 65,
      width: double.infinity,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HomeButtonIcon(),
            GradientIcon(
                size: 40,
                icon: Icons.person,
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xff9ae5bf), Color(0xffd7f6e6)])),
            GradientIcon(
                size: 40,
                icon: Icons.shopping_cart,
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xff9ae5bf), Color(0xffd7f6e6)])),
            GradientIcon(
                size: 40,
                icon: Icons.wechat,
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Color(0xff9ae5bf), Color(0xffd7f6e6)]))
          ],
        ),
      ),
    );
  }
}
