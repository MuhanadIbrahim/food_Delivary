import 'package:flutter/material.dart';
import 'package:food_delivery_app/constans/constans.dart';

import 'borderless_box_decoration.dart';
import 'gradient_icon.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleIconPressed(int index) {
    setState(() {
      _selectedIndex = index;
      _animationController.forward(from: 0.0);
      if (_selectedIndex == 2) {
        Navigator.pushNamed(context, kBascketScrean);
      } else if (_selectedIndex == 0) {
        Navigator.pushNamed(context, kHomeScrean);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: borderLessBoxDecoration(),
      height: 65,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIcon(0, Icons.home, 'Home'),
            _buildIcon(1, Icons.person, 'Profile'),
            _buildIcon(2, Icons.shopping_cart, 'Cart'),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index, IconData icon, String text) {
    return AnimatedContainer(
      duration: _animationController.duration!,
      curve: Curves.easeInOut,
      // Limit width to prevent overflow
      width: _selectedIndex == index
          ? MediaQuery.of(context).size.width *
              0.4 // Adjust based on your layout
          : 40,
      height: 44,
      decoration: ShapeDecoration(
        gradient: _selectedIndex == index
            ? LinearGradient(
                begin: Alignment(0.99, -0.15),
                end: Alignment(-0.99, 0.15),
                colors: [Color(0xFFecfcf2), Color(0xFFe8f9f1)],
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: InkWell(
        onTap: () => _handleIconPressed(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GradientIcon(
              size: _selectedIndex == index ? 37 : 40,
              icon: icon,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff48dd89), Color(0xff1cc37a)],
              ),
            ),
            if (_selectedIndex == index)
              Flexible(
                // Wrap text to avoid overflow
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color(0xFF09051C),
                    fontSize: 15,
                    fontFamily: 'BentonSans Medium',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
