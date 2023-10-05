import 'package:flutter/material.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      width: 320,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            borderSide: BorderSide(width: 20, color: Colors.transparent),
          ),
          prefixIcon: IconTheme(
            data: IconThemeData(
              size: 38,
              color: Color(0xffda6317),
            ),
            child: Icon(
              Icons.search,
            ),
          ),
          hintText: 'What do you want to order?',
          hintStyle: TextStyle(
            color: Color(0xFFDA6317),
            fontSize: 15,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.50,
          ),
          filled: true,
          fillColor: Color(0xfffef5ec),
        ),
      ),
    );
  }
}
