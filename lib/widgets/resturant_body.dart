import 'package:flutter/material.dart';

class ResturantScreanBody extends StatelessWidget {
  const ResturantScreanBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showModalBottomSheet(context),
      ),
      body: Builder(
        builder: (BuildContext context) {
          Future.delayed(Duration.zero, () => _showModalBottomSheet(context));
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Photo Restaurantjpg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
