import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/update_user_info_bloc/update_user_info_bloc.dart';
import 'package:food_delivery_app/widgets/popular_resturant_scrolling.dart';
import 'package:food_delivery_app/widgets/special_deal_promo.dart';
import 'package:food_delivery_app/widgets/textof_nears_restrunt_viewmore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/authentication/bloc/authentication_bloc.dart';
import '../bloc/my_user_bloc/my_user_bloc.dart';
import 'find_your_food_widget.dart';
import 'menu_details_price_card.dart';
import 'nearst_resturant_scrolling.dart';
import 'custom_navigation_bar.dart';

class HomeScreanBodyContent extends StatefulWidget {
  const HomeScreanBodyContent({super.key});

  @override
  State<HomeScreanBodyContent> createState() => _HomeScreanBodyContentState();
}

class _HomeScreanBodyContentState extends State<HomeScreanBodyContent> {
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
                          width: 10,
                        ),
                        Text(
                          'Welcome Muhanad',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                children: const [
                  SpecialDealPromoHomeScrean(),
                  SizedBox(
                    height: 20,
                  ),
                  TextOfNearstResAndTextOfViewMore(),
                  SizedBox(
                    height: 20,
                  ),
                  NearstResturantCardsScrolling(),
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
                  Text(
                    'Popular Restaurant',
                    style: TextStyle(
                      color: Color(0xFF09041B),
                      fontSize: 18,
                      fontFamily: 'BentonSans Bold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PopularResutrantScrolling(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: CustomNavigationBar(),
            )
          ],
        ),
      ),
    );
  }
}
