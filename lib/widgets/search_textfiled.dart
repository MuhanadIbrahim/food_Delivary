import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/constans.dart';
import '../views/search_page.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RestaurantSearchScreen()),
        );
      },
      child: Container(
        height: 39.h,
        width: 250.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0.r)),

          color: const Color(0xfffef5ec), // Same background color as TextField
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Icon remains the same
            IconTheme(
              data: IconThemeData(
                size: 25.sp,
                color: const Color(0xffda6317),
              ),
              child: const Icon(Icons.search),
            ),
            // Add a spacer to mimic text field padding
            SizedBox(width: 15.w), // Adjust spacing as needed
            // Use a Text widget for the hint text (optional)
            Text(
              'What do you want to order?',
              style: TextStyle(
                color: const Color(0xFFDA6317),
                fontSize: 12.sp, // Uncomment if needed
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
