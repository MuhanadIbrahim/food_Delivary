import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_delivery_app/bloc/sign_in_method/sign_in_method_bloc.dart';

import 'package:food_delivery_app/bloc/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:food_delivery_app/widgets/list_popular_menu.dart';
import 'package:food_delivery_app/widgets/special_deal_promo.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/authentication/bloc/authentication_bloc.dart';
import '../bloc/get_all_restaurant/get_all_restaurant_bloc.dart';
import '../bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import '../bloc/my_user_bloc/my_user_bloc.dart';
import '../constans/constans.dart';
import 'content_card.dart';
import 'find_your_food_widget.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInMethodBloc()..add(SignInAllMethodEvent()),
        ),
        BlocProvider(
          create: (context) => UpdateUserInfoBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(15.0),
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
              child: BlocBuilder<SignInMethodBloc, SignInMethodState>(
                builder: (context, state) {
                  if (state is SignInMethodEmailPassword) {
                    return BlocBuilder<MyUserBloc, MyUserState>(
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
                                          final ImagePicker picker =
                                              ImagePicker();
                                          final XFile? image =
                                              await picker.pickImage(
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
                                                            ratioX: 1,
                                                            ratioY: 1),
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
                                          final ImagePicker picker =
                                              ImagePicker();
                                          final XFile? image =
                                              await picker.pickImage(
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
                                                            ratioX: 1,
                                                            ratioY: 1),
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
                                width: 10.w,
                              ),
                              Text(
                                'Welcome Muhanad',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    );
                  } else if (state is SignInMethodFacebook) {
                    return Row(
                      children: [
                        // Avatar with shadow
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                                offset: const Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              state.imageUrl,
                              fit: BoxFit.cover,
                              width: 60.0,
                              height: 60.0,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  child: const Icon(Icons.person),
                                );
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: SpinKitChasingDots(
                                      color: Colors.grey[300], size: 30.0),
                                );
                              },
                            ),
                          ),
                        ),

                        // Animated name with delay
                        const SizedBox(width: 10.0),

                        AnimatedTextKit(
                          totalRepeatCount:
                              1, // Infinite animation (or specify a number)
                          animatedTexts: [
                            TyperAnimatedText(
                              state.userName,
                              textStyle: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          pause: const Duration(milliseconds: 1000),

                          onTap: () {
                            // Handle tap on name (optional)
                          },
                        ),
                      ],
                    );
                  } else if (state is SignInMethodGoogle) {
                    return Row(
                      children: [
                        // Avatar with shadow
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                                offset: const Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.network(
                              state.imageUrl,
                              fit: BoxFit.cover,
                              width: 60.0,
                              height: 60.0,
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  child: const Icon(Icons.person),
                                );
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: SpinKitChasingDots(
                                      color: Colors.grey[300], size: 30.0),
                                );
                              },
                            ),
                          ),
                        ),

                        // Animated name with delay
                        const SizedBox(width: 10.0),

                        AnimatedTextKit(
                          totalRepeatCount:
                              1, // Infinite animation (or specify a number)
                          animatedTexts: [
                            TyperAnimatedText(
                              state.userName,
                              textStyle: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          pause: const Duration(milliseconds: 1000),

                          onTap: () {
                            // Handle tap on name (optional)
                          },
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
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
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, kAllRestaurantScrean);
                      },
                      child: TextOfNearstResAndTextOfViewMore()),
                  const SizedBox(
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
                                  subtitle: restaurant.phoneNumber.toString(),
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextOfPopluarMenuAndTextOfViewMore(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: ListPopularMenu()),
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
                                subtitle: restaurant.phoneNumber.toString()),
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
