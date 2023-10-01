import 'package:flutter/material.dart';

BoxDecoration customBoxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    gradient: const LinearGradient(
      begin: Alignment(-1, -1.123),
      end: Alignment(1, 1.228),
      colors: <Color>[Color(0xff53e78b), Color(0xff14be77)],
      stops: <double>[0, 1],
    ),
  );
}
