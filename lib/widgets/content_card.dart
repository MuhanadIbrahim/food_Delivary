import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'decoration_resturant_card.dart';

class ContentResturantCard extends StatelessWidget {
  const ContentResturantCard({
    super.key,
    required this.jpg,
    required this.title,
    required this.subtitle,
  });
  final String jpg;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147,
      height: 184,
      decoration: decorationOfResturantCard(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedNetworkImage(
            height: 184 / 2,
            imageUrl: jpg,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          //Image.asset(jpg),

          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'BentonSans Bold',
              fontWeight: FontWeight.bold,
            ),
          ),

          Opacity(
            opacity: 0.50,
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'BentonSans Book',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
