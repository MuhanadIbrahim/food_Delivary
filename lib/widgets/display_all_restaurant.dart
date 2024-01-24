import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';

import '../my_restaurant/restaurant_entity.dart';
import 'content_card.dart';

class DispalyAllRestaurant extends StatefulWidget {
  const DispalyAllRestaurant({super.key});

  @override
  State<DispalyAllRestaurant> createState() => _DispalyAllRestaurantState();
}

class _DispalyAllRestaurantState extends State<DispalyAllRestaurant> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllRestaurantBloc(),
      child:  DispalyAllRestaurantBody(),
    );

    // StreamBuilder<QuerySnapshot>(
    //   stream: FirebaseFirestore.instance.collection('restaurants').snapshots(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Center(child: Text('Error fetching restaurants'));
    //     }

    //     if (!snapshot.hasData) {
    //       return Center(child: CircularProgressIndicator());
    //     }

    //     final restaurants = snapshot.data!.docs;
    //     print('========================$restaurants');
    //     MyRestaurantEntity allRestaurant = MyRestaurantEntity.fromDocument(
    //         restaurants as Map<String, dynamic>);

    //     return ListView.builder(
    //       itemCount: restaurants.length,
    //       itemBuilder: (context, index) {
    //         final restaurant = restaurants[index];
    //         return ContentResturantCard(
    //           jpg: 'assets/images/LogoVeganLoverResturantjpg.jpg',
    //           title: 'saed',
    //           subtitle: '12 Mins',
    //         );
    //       },
    //     );
    //   },
    // );
  }
}

class DispalyAllRestaurantBody extends StatefulWidget {
  const DispalyAllRestaurantBody({super.key});

  @override
  State<DispalyAllRestaurantBody> createState() =>
      _DispalyAllRestaurantBodyState();
}

class _DispalyAllRestaurantBodyState extends State<DispalyAllRestaurantBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
        builder: (context, state) {
      if (state is GetAllRestaurantLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is GetAllRestaurantFaliuer) {
        return const Center(
          child: Text('there is something Wrong'),
        );
      }
      if (state is GetAllRestaurantSuccess) {
        ListView.builder(
          itemCount: state.allRestaurant.length,
          itemBuilder: (context, index) {
            final restaurant = state.allRestaurant[index];
            return ContentResturantCard(
              jpg: 'assets/images/LogoVeganLoverResturantjpg.jpg',
              title: restaurant.name,
              subtitle: restaurant.email,
            );
          },
        );
      }
      return const SizedBox();
    });
  }
}
