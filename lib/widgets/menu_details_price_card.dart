import 'package:flutter/material.dart';

import 'borderless_box_decoration.dart';

class MenuDetailsPriceCard extends StatelessWidget {
  const MenuDetailsPriceCard({
    super.key,
    required this.jpg,
    required this.title,
    required this.subtitle,
    required this.price,
  });
  final String jpg;
  final String title;
  final String subtitle;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: borderLessBoxDecoration(),
      child: ListTile(
        leading: Image.asset(jpg),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF09041B),
            fontSize: 15,
            fontFamily: 'BentonSans Medium',
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Opacity(
          opacity: 0.30,
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF3B3B3B),
              fontSize: 14,
              fontFamily: 'BentonSans Regular',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.50,
            ),
          ),
        ),
        trailing: Text(
          '\$ ${price.toString()}',
          style: const TextStyle(
            color: Color(0xFFFEAD1D),
            fontSize: 22,
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
