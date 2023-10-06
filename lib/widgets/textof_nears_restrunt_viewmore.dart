import 'package:flutter/material.dart';

class TextOfNearstResAndTextOfViewMore extends StatelessWidget {
  const TextOfNearstResAndTextOfViewMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Nearest Restaurant',
          style: TextStyle(
            color: Color(0xFF09041B),
            fontSize: 18,
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'View More',
          style: TextStyle(
            color: Color(0xFFFF7B32),
            fontSize: 15,
            fontFamily: 'BentonSans Book',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}




class TextOfPopluarMenuAndTextOfViewMore extends StatelessWidget {
  const TextOfPopluarMenuAndTextOfViewMore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
           'Popular Menu',
          style: TextStyle(
            color: Color(0xFF09041B),
            fontSize: 18,
            fontFamily: 'BentonSans Bold',
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'View More',
          style: TextStyle(
            color: Color(0xFFFF7B32),
            fontSize: 15,
            fontFamily: 'BentonSans Book',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
