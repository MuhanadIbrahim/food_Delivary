

import 'package:flutter/material.dart';

class CustomTextFormFieldForPassword extends StatelessWidget {
  const CustomTextFormFieldForPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
                width: 2, color: Colors.grey), // Border color
          ),
          hintText: 'Password',
          hintStyle:
              TextStyle(color: Colors.grey), // Color of the hint text
        ),
      ),
    );
  }
}

class CustomTextFormFieldForEmail extends StatelessWidget {
  const CustomTextFormFieldForEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 2, color: Colors.grey)),
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
