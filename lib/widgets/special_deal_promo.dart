
import 'package:flutter/material.dart';

class SpecialDealPromoHomeScrean extends StatelessWidget {
  const SpecialDealPromoHomeScrean({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Image.asset('assets/images/Promo Advertisingjpg.jpg',
          fit: BoxFit.contain),
    );
  }
}
