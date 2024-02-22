

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/borderless_box_decoration.dart';

class MealBasketCard extends StatelessWidget {
  const MealBasketCard({
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
        leading: CachedNetworkImage(
          height: 184 / 2,
          imageUrl: jpg,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Column(children: [
          Text(
          title,
          style: const TextStyle(
            color: Color(0xFF09041B),
            fontSize: 15,
            fontFamily: 'BentonSans Medium',
            fontWeight: FontWeight.bold,
          ),
        ),
                 Opacity(
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
        Text(
          '\$ ${price.toString()}',
          style: const TextStyle(
            color: Color(0xFFFEAD1D),
            fontSize: 22,
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.w400,
          ),
        ),     

           Text(
          '\$ ${price.toString()}',
          style: const TextStyle(
            color: Colors.greenAccent,
            fontSize: 22,
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.w400,
          ),
        ),
        ],)
        
       
      ),
    );
  }
}
