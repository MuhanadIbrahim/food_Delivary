 import 'package:flutter/material.dart';

BoxDecoration borderLessBoxDecoration() {
    return   BoxDecoration(
            color:const  Color(0xffffffff),
            border: Border.all(
              color:const  Color(0xffffffff),
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow:const  [
              BoxShadow(
                  offset: Offset(0, 0),
                  color: Color(0x115a6cea),
                  spreadRadius: 25,
                  blurRadius: 25)
            ],
          );
  }