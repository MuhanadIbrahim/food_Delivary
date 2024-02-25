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
  void didChangeDependencies() {
    super.didChangeDependencies();
    final indexFromArgs = ModalRoute.of(context)?.settings.arguments as int?;
    if (indexFromArgs != null && _selectedIndex != indexFromArgs) {
      setState(() {
        _selectedIndex = indexFromArgs;
      });
    }
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
        Navigator.pushNamed(context, kBascketScrean, arguments: 2);
      } else if (_selectedIndex == 0) {
        Navigator.pushNamed(context, kHomeScrean, arguments: 0);
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
            _buildIcon(0, 'Home', 'assets/images/wired-gradient-63-home.gif'),
            _buildIcon(
                1, 'Profile', 'assets/images/wired-gradient-21-avatar.gif'),
            _buildIcon(
                2, 'Cart', 'assets/images/wired-gradient-146-trolley.gif'),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index, String text, String image) {
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
                colors: [Color(0xFF90EE90), Color(0xFFe8f9f1)],
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
            _selectedIndex == index
                ? Image(
                    image: AssetImage(image), // Replace with your image path
                    width: _selectedIndex == index
                        ? 35
                        : 40, // Adjust size as needed
                    height: _selectedIndex == index
                        ? 35
                        : 40, // Adjust size as needed
                  )
                : Image(
                    image: AssetImage(image), // Replace with your image path
                    width: _selectedIndex == index
                        ? 35
                        : 40, // Adjust size as needed
                    height: _selectedIndex == index
                        ? 35
                        : 40, // Adjust size as needed
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
