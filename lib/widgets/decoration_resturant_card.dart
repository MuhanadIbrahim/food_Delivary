 import 'package:flutter/material.dart';

ShapeDecoration decorationOfResturantCard() {
    return ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x115A6CEA),
                          blurRadius: 50,
                          offset: Offset(12, 26),
                          spreadRadius: 0,
                        )
                      ],
                    );
  }