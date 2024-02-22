import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/my_user/firebase_user_repository.dart';
import 'package:food_delivery_app/my_user/user_repository.dart';
import 'package:food_delivery_app/simple_bloc_observer.dart';
import 'package:food_delivery_app/views/all_restaurant_page.dart';
import 'package:food_delivery_app/views/basket_screan.dart';
import 'package:food_delivery_app/views/forget_password.dart';
import 'package:food_delivery_app/views/home_screan.dart';
import 'package:food_delivery_app/views/login_screan.dart';
import 'package:food_delivery_app/views/meal_detail_screan.dart';
import 'package:food_delivery_app/views/payment_method.dart';
import 'package:food_delivery_app/views/rest_password_screan.dart';
import 'package:food_delivery_app/views/restpassword_successnotication_screan.dart';
import 'package:food_delivery_app/views/resturant_home_screan.dart';
import 'package:food_delivery_app/views/screan1.dart';
import 'package:food_delivery_app/views/screan2.dart';
import 'package:food_delivery_app/views/screan3.dart';
import 'package:food_delivery_app/views/search_page.dart';
import 'package:food_delivery_app/views/set_location_screan.dart';
import 'package:food_delivery_app/views/sign_up_process.dart';
import 'package:food_delivery_app/views/sign_up_screan.dart';
import 'package:food_delivery_app/views/signup_success_notication_screan.dart';
import 'package:food_delivery_app/views/upload_preview_screan.dart';
import 'package:food_delivery_app/views/upload_screan.dart';
import 'package:food_delivery_app/views/vertification_code_screan.dart';

import 'bloc/meal_required_restaurant/meal_required_restaurant_bloc.dart';
import 'bloc/my_user_bloc/my_user_bloc.dart';
import 'bloc/update_user_info_bloc/update_user_info_bloc.dart';
import 'firebase_options.dart';
import 'widgets/custom_splash_screan.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyC2_xkFRfmghiMhtUrg4UvREGjohZGb9yY",
            appId: "1:1049602785511:android:7d549fd2e03fb73a2ca242",
            messagingSenderId: "1049602785511",
            projectId: "food-delivery-5e75d",
          ),
        )
      : await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
  Bloc.observer = SimpleBlocObserver();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await ScreenUtil.ensureScreenSize(); // In
  runApp(MyApp(FirebaseUserRepository()));
}

class MyApp extends StatefulWidget {
  final UserRepository userRepository;

  const MyApp(this.userRepository, {super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   Connectivity().onConnectivityChanged.listen;
  //   ConnectivityService();
  //   // TODO: implement initState
  //   super.initState();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationBloc>(
            create: (_) =>
                AuthenticationBloc(myUserRepository: widget.userRepository),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MealRequiredRestaurantBloc(),
            ),
            BlocProvider(
              create: (context) => BasketBloc(),
            ),
          ],
          child: ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            // Use builder only if you need to use library outside ScreenUtilInit context
            builder: (_, child) {
              return MaterialApp(
                routes: {
                  kScrean1: (context) => const Screan1(),
                  kScrean2: (context) => const Screan2(),
                  kScrean3: (context) => const Screan3(),
                  kLoginScrean: (context) => const LoginScrean(),
                  kSignUpScrean: (context) => const SignUpScrean(),
                  kSignUpProcess: (context) => const SignUpProcess(),
                  kPaymentMethod: (context) => const PaymentMethodScrean(),
                  kUplaodScrean: (context) => const UploadScrean(),
                  kUploadPreview: (context) => const UploadPreviewScrean(),
                  kSetLocationScrean: (context) => const SetLocationScrean(),
                  kSignUpSuccessNotification: (context) =>
                      const SignupSuccessNotifaction(),
                  kVertificationCodeScrean: (context) =>
                      const VertificationCodeScrean(),
                  kForgetPasswordScrean: (context) =>
                      const ForgetPasswordScrean(),
                  kRestpasswordScrean: (context) => const RestPasswordScrean(),
                  kRestpasswordNoticationSuccess: (context) =>
                      const RestPasswordSuccesNoticationScrean(),
                  kHomeScrean: (context) => const HomeScrean(),
                  kResutrantScrean: (context) => const ResturantHomeScrean(),
                  kSearchPageScrean: (context) =>
                      const RestaurantSearchScreen(),
                  kAllRestaurantScrean: (context) => const AllRestaurantPage(),
                  kMealDetailScrean: (context) => const MealDetailScrean(),
                  kBascketScrean: (context) => const CartScrean(),
                },
                home: StreamBuilder<ConnectivityResult>(
                    stream: Connectivity().onConnectivityChanged,
                    builder: (context, snapshot) {
                      
                      if (snapshot.data == ConnectivityResult.wifi||
                          snapshot.data == ConnectivityResult.mobile) {
                        return BlocProvider(
                          create: (context) => MyUserBloc(
                              myUserRepository: context
                                  .read<AuthenticationBloc>()
                                  .userRepository)
                            ..add(GetMyUser(
                                myUserId: context
                                    .read<AuthenticationBloc>()
                                    .state
                                    .user!
                                    .uid)),
                          child: BlocProvider(
                            create: (context) => UpdateUserInfoBloc(
                                userRepository: context
                                    .read<AuthenticationBloc>()
                                    .userRepository),
                            child: const CustomSplashScreanWidget(),
                          ),
                        );
                      } else {
                        return Scaffold(
                          body: Center(
                            child: Image.asset(
                                'assets/images/No_internet_connection_illustration_concept_vector003_generated.jpg'),
                          ),
                        );
                      }
                    }),
                // Set the initial page
                theme: ThemeData(fontFamily: 'Roboto'),

                debugShowCheckedModeBanner: false,
              );
            },
          ),
        ));
  }
}
