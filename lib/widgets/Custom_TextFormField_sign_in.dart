import 'package:flutter/material.dart';

class CustomTextFormFieldForPassword extends StatefulWidget {
  CustomTextFormFieldForPassword(
      {super.key,
      required this.onchanged,
      this.iconPassword = Icons.visibility});
  final void Function(String) onchanged;
  IconData iconPassword;

  @override
  State<CustomTextFormFieldForPassword> createState() =>
      _CustomTextFormFieldForPasswordState();
}

class _CustomTextFormFieldForPasswordState
    extends State<CustomTextFormFieldForPassword> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              color: Color(0x115a6cea),
              spreadRadius: 25,
              blurRadius: 50)
        ],
      ),
      width: MediaQuery.of(context).size.width - 40,
      child: TextFormField(
        obscureText: !obscurePassword,
        onChanged: widget.onchanged,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Password';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                  if (obscurePassword) {
                    widget.iconPassword = Icons.visibility;
                  } else {
                    widget.iconPassword = Icons.visibility_off;
                  }
                });
              },
              icon: Icon(widget.iconPassword)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(width: 2, color: Colors.grey), // Border color
          ),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey), // Color of the hint text
        ),
      ),
    );
  }
}

class CustomTextFormFieldForEmail extends StatelessWidget {
  const CustomTextFormFieldForEmail({
    super.key,
    required this.onchanged,
  });
  final void Function(String) onchanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              color: Color(0x115a6cea),
              spreadRadius: 20,
              blurRadius: 50)
        ],
      ),
      width: MediaQuery.of(context).size.width - 40,
      child: TextFormField(
        onChanged: onchanged,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Email';
          }
        },
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
