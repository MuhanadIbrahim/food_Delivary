import 'package:flutter/material.dart';

class PopularButton extends StatelessWidget {
  const PopularButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 44,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.99, -0.15),
          end: Alignment(-0.99, 0.15),
          colors: [Color(0xFFecfcf2), Color(0xFFe8f9f1)],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Center(
        child: Text(
          'Popular',
          style: TextStyle(
              color: Color(0xFF53E78B),
              fontSize: 15,
              fontFamily: 'BentonSans Medium',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
