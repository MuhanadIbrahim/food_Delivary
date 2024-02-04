import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 250.w,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12.0.r),
            ),
            borderSide: BorderSide(width: 20.w, color: Colors.transparent),
          ),
          prefixIcon: IconTheme(
            data: IconThemeData(
              size: 25.sp,
              color: const Color(0xffda6317),
            ),
            child: const Icon(
              Icons.search,
            ),
          ),
          hintText: 'What do you want to order?',
          hintStyle: TextStyle(
            color: const Color(0xFFDA6317),
            // fontSize: 10.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.11.sp,
          ),
          filled: true,
          fillColor: const Color(0xfffef5ec),
        ),
      ),
    );
  }
}
