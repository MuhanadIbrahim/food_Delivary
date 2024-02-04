import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/views/seach_page_body.dart';

import '../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_restaurant/search_restaurant_bloc.dart';


// ... other imports

class RestaurantSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllRestaurantBloc()..add(GetAllRestaurantEvent()),
      child: BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
        builder: (context, restaurantsState) {
          if (restaurantsState is GetAllRestaurantSuccess) {
            return BlocProvider(
              create: (context) => SearchRestaurantBloc(restaurantsState.allRestaurant),
              child: RestaurantSearchWidget(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(), // Or handle loading/error states
            );
          }
        },
      ),
    );
  }
}

class RestaurantSearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchRestaurantBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Restaurants'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (query) => searchBloc.add(SearchQueryChanged(query)),
          ),
          BlocBuilder<SearchRestaurantBloc, SearchRestaurantState>(
            builder: (context, state) {
              if (state is SearchRestaurantLoaded) {
                return ListView.builder(
                  itemCount: state.restaurants.length,
                  itemBuilder: (context, index) => Text(state.restaurants[index].name),
                );
              } else {
                return Text('No results');
              }
            },
          ),
        ],
      ),
    );
  }
}
