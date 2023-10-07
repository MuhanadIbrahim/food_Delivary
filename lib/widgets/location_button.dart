import 'package:flutter/material.dart';

import 'gradient_icon.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFe8f9f1),
      radius: 20,
      child: Container(
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.99, -0.15),
            end: Alignment(-0.99, 0.15),
            colors: [Color(0xFFecfcf2), Color(0xFFe8f9f1)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: const GradientIcon(
          size: 25,
          icon: Icons.location_on,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff48dd89), Color(0xff1cc37a)],
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red[200],
      radius: 20,
      child: Container(
        child: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ),
    );
  }
}
