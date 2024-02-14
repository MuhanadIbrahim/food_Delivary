import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';

import '../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import '../constans/constans.dart';
import '../widgets/content_card.dart';

class AllRestaurantPage extends StatefulWidget {
  const AllRestaurantPage({super.key});

  @override
  State<AllRestaurantPage> createState() => _AllRestaurantPageState();
}

class _AllRestaurantPageState extends State<AllRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllRestaurantBloc()..add(GetAllRestaurantEvent()),
      child: const AllRestaurantPageBody(),
    );
  }
}

class AllRestaurantPageBody extends StatelessWidget {
  const AllRestaurantPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Restaurant'),
      ),
      body: Builder(builder: (context) {
        return BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
            builder: (context, state) {
          if (state is GetAllRestaurantLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllRestaurantFaliuer) {
            return const Center(
              child: Text('there is something Wrong'),
            );
          } else if (state is GetAllRestaurantSuccess) {
            return GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemCount: state.allRestaurant.length,
              itemBuilder: (context, index) {
                final restaurant = state.allRestaurant[index];
                return GestureDetector(
                  onTap: () {
                    final tappedIndex = index;

                    Navigator.pushNamed(context, kResutrantScrean);
                    // context.read<GetAllMealsBloc>().add(
                    //     RequiredRestaurant(
                    //         requiredRestaurants: tappedIndex));
                    context.read<MealRequiredRestaurantBloc>().add(
                        MealsRequiredEvent(requiredRestaurants: tappedIndex));
                  },
                  child: ContentResturantCard(
                      jpg: restaurant.picture!,
                      title: restaurant.name,
                      subtitle: restaurant.phoneNumber.toString()),
                );
              },
            );
          } else {
            return const SizedBox();
          }
          // return const SizedBox();
        });
      }),
    );
  }
}
