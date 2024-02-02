import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:food_delivery_app/my_restaurant/restaurant_entity.dart';
import 'package:food_delivery_app/widgets/popular_resturant_scrolling.dart';
import 'package:food_delivery_app/widgets/special_deal_promo.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/authentication/bloc/authentication_bloc.dart';
import '../bloc/get_all_meals/get_all_meals_bloc.dart';
import '../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import '../bloc/my_user_bloc/my_user_bloc.dart';
import '../constans/constans.dart';
import '../my_restaurant/restaurant.dart';
import 'content_card.dart';
import 'find_your_food_widget.dart';
import 'menu_details_price_card.dart';
import 'custom_navigation_bar.dart';

class HomeScreanBodyContent extends StatefulWidget {
  const HomeScreanBodyContent({super.key});

  @override
  State<HomeScreanBodyContent> createState() => _HomeScreanBodyContentState();
}

class _HomeScreanBodyContentState extends State<HomeScreanBodyContent> {
  @override
  void initState() {
    context.read<GetAllRestaurantBloc>().add(GetAllRestaurantEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocProvider(
        create: (context) => UpdateUserInfoBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            BlocProvider(
              create: (context) => MyUserBloc(
                  myUserRepository:
                      context.read<AuthenticationBloc>().userRepository)
                ..add(GetMyUser(
                    myUserId:
                        context.read<AuthenticationBloc>().state.user!.uid)),
              child: BlocBuilder<MyUserBloc, MyUserState>(
                builder: (context, state) {
                  if (state.status == MyUserStatus.success) {
                    return Row(
                      children: [
                        state.user!.picture == ""
                            ? BlocListener<UpdateUserInfoBloc,
                                UpdateUserInfoState>(
                                listener: (context, state) {
                                  if (state is UploadPictureSuccess) {
                                    context
                                        .read<MyUserBloc>()
                                        .state
                                        .user!
                                        .picture = state.userImage;

                                    setState(() {});
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () async {
                                    const CircularProgressIndicator();
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? image = await picker.pickImage(
                                        source: ImageSource.gallery,
                                        maxHeight: 500,
                                        maxWidth: 500,
                                        imageQuality: 40);
                                    image;
                                    if (image != null) {
                                      CroppedFile? croppedFile =
                                          await ImageCropper().cropImage(
                                              sourcePath: image.path,
                                              aspectRatio:
                                                  const CropAspectRatio(
                                                      ratioX: 1, ratioY: 1),
                                              aspectRatioPresets: [
                                            CropAspectRatioPreset.square
                                          ],
                                              uiSettings: [
                                            AndroidUiSettings(
                                                toolbarTitle: 'Cropper',
                                                toolbarWidgetColor:
                                                    Colors.white,
                                                initAspectRatio:
                                                    CropAspectRatioPreset
                                                        .original,
                                                lockAspectRatio: false)
                                          ]);
                                      if (croppedFile != null) {
                                        var imageUrl = UploadPicture(
                                            croppedFile.path,
                                            context
                                                .read<MyUserBloc>()
                                                .state
                                                .user!
                                                .id);
                                        setState(() {
                                          context
                                              .read<UpdateUserInfoBloc>()
                                              .add(imageUrl);
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.person_outline,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              )
                            : BlocListener<UpdateUserInfoBloc,
                                UpdateUserInfoState>(
                                listener: (context, state) {
                                  if (state is UploadPictureSuccess) {
                                    context
                                        .read<MyUserBloc>()
                                        .state
                                        .user!
                                        .picture = state.userImage;

                                    setState(() {});
                                  }
                                },
                                child: GestureDetector(
                                  onTap: () async {
                                    final ImagePicker picker = ImagePicker();
                                    final XFile? image = await picker.pickImage(
                                        source: ImageSource.gallery,
                                        maxHeight: 500,
                                        maxWidth: 500,
                                        imageQuality: 40);
                                    image;
                                    if (image != null) {
                                      CroppedFile? croppedFile =
                                          await ImageCropper().cropImage(
                                              sourcePath: image.path,
                                              aspectRatio:
                                                  const CropAspectRatio(
                                                      ratioX: 1, ratioY: 1),
                                              aspectRatioPresets: [
                                            CropAspectRatioPreset.square
                                          ],
                                              uiSettings: [
                                            AndroidUiSettings(
                                                toolbarTitle: 'Cropper',
                                                toolbarWidgetColor:
                                                    Colors.white,
                                                initAspectRatio:
                                                    CropAspectRatioPreset
                                                        .original,
                                                lockAspectRatio: false)
                                          ]);
                                      if (croppedFile != null) {
                                        var imageUrl = UploadPicture(
                                            croppedFile.path,
                                            context
                                                .read<MyUserBloc>()
                                                .state
                                                .user!
                                                .id);
                                        setState(() {
                                          context
                                              .read<UpdateUserInfoBloc>()
                                              .add(imageUrl);
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                state.user!.picture!),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              ),
                        SizedBox(
                          width: 0.09 * MediaQuery.of(context).size.width,
                        ),
                        Text(
                          'Welcome Muhanad',
                          style: TextStyle(
                              fontSize:
                                  20 * MediaQuery.of(context).textScaleFactor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            findYourFood(context),
            Expanded(
              child: ListView(
                children: [
                  SpecialDealPromoHomeScrean(),
                  SizedBox(
                    height: 20,
                  ),
                  TextOfNearstResAndTextOfViewMore(),
                  SizedBox(
                    height: 20,
                  ),
                  // NearstResturantCardsScrolling(),
                  Container(
                    width: 200,
                    height: 200,
                    child: BlocBuilder<GetAllRestaurantBloc,
                        GetAllRestaurantState>(builder: (context, state) {
                      if (state is GetAllRestaurantLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetAllRestaurantFaliuer) {
                        return const Center(
                          child: Text('there is something Wrong'),
                        );
                      } else if (state is GetAllRestaurantSuccess) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.allRestaurant.length,
                          itemBuilder: (context, index) {
                            final restaurant = state.allRestaurant[index];

                            return GestureDetector(
                              onTap: () {
                                // Access the index directly here
                                final tappedIndex = index;

                                Navigator.pushNamed(context, kResutrantScrean);
                                // context.read<GetAllMealsBloc>().add(
                                //     RequiredRestaurant(
                                //         requiredRestaurants: tappedIndex));
                                context.read<MealRequiredRestaurantBloc>().add(
                                    MealsRequiredEvent(
                                        requiredRestaurants: tappedIndex));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: ContentResturantCard(
                                  jpg:
                                      'assets/images/LogoVeganLoverResturantjpg.jpg',
                                  title: restaurant.name,
                                  subtitle: restaurant.email,
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                      // return const SizedBox();
                    }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextOfPopluarMenuAndTextOfViewMore(),
                  SizedBox(
                    height: 20,
                  ),
                  MenuDetailsPriceCard(
                    jpg: 'assets/images/Green Nodejpg.jpg',
                    title: 'Green Noddle',
                    subtitle: 'Noodle Home',
                    price: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MenuDetailsPriceCard(
                      jpg: 'assets/images/fruitSaladjpg.jpg',
                      title: 'Fruit Salad',
                      subtitle: 'Wijie Resto',
                      price: 5),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Popular Restaurant',
                    style: TextStyle(
                      color: Color(0xFF09041B),
                      fontSize: 18,
                      fontFamily: 'BentonSans Bold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // PopularResutrantScrolling(),
                  BlocBuilder<GetAllRestaurantBloc, GetAllRestaurantState>(
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  MealsRequiredEvent(
                                      requiredRestaurants: tappedIndex));
                            },
                            child: ContentResturantCard(
                                jpg:
                                    'assets/images/logoHealthyOrganicProducrResturantjpg.jpg',
                                title: restaurant.name,
                                subtitle: restaurant.email),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                    // return const SizedBox();
                  })
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: CustomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}
