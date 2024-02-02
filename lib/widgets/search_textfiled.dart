import 'package:flutter/material.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.149 * MediaQuery.of(context).size.width,
      width: 0.38 * MediaQuery.of(context).size.height,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(width: 20, color: Colors.transparent),
          ),
          prefixIcon: IconTheme(
            data: IconThemeData(
              size: 38 * MediaQuery.of(context).textScaleFactor,
              color: const Color(0xffda6317),
            ),
            child: const Icon(
              Icons.search,
            ),
          ),
          hintText: 'What do you want to order?',
          hintStyle: TextStyle(
            color: const Color(0xFFDA6317),
            fontSize: 9 * MediaQuery.of(context).textScaleFactor,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.50,
          ),
          filled: true,
          fillColor: const Color(0xfffef5ec),
        ),
      ),
    );
  }
}
