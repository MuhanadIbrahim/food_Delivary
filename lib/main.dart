import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:food_delivery_app/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:food_delivery_app/constans/constans.dart';
import 'package:food_delivery_app/my_user/firebase_user_repository.dart';
import 'package:food_delivery_app/my_user/user_repository.dart';
import 'package:food_delivery_app/simple_bloc_observer.dart';
import 'package:food_delivery_app/views/forget_password.dart';
import 'package:food_delivery_app/views/home_screan.dart';
import 'package:food_delivery_app/views/login_screan.dart';
import 'package:food_delivery_app/views/payment_method.dart';
import 'package:food_delivery_app/views/rest_password_screan.dart';
import 'package:food_delivery_app/views/restpassword_successnotication_screan.dart';
import 'package:food_delivery_app/views/resturant_home_screan.dart';
import 'package:food_delivery_app/views/screan1.dart';
import 'package:food_delivery_app/views/screan2.dart';
import 'package:food_delivery_app/views/screan3.dart';
import 'package:food_delivery_app/views/set_location_screan.dart';
import 'package:food_delivery_app/views/sign_up_process.dart';
import 'package:food_delivery_app/views/sign_up_screan.dart';
import 'package:food_delivery_app/views/signup_success_notication_screan.dart';
import 'package:food_delivery_app/views/upload_preview_screan.dart';
import 'package:food_delivery_app/views/upload_screan.dart';
import 'package:food_delivery_app/views/vertification_code_screan.dart';

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
  runApp(MyApp(FirebaseUserRepository()));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  const MyApp(this.userRepository, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationBloc>(
            create: (_) => AuthenticationBloc(myUserRepository: userRepository),
          ),
        ],
        child: MaterialApp(
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
            kForgetPasswordScrean: (context) => const ForgetPasswordScrean(),
            kRestpasswordScrean: (context) => const RestPasswordScrean(),
            kRestpasswordNoticationSuccess: (context) =>
                const RestPasswordSuccesNoticationScrean(),
            kHomeScrean: (context) => const HomeScrean(),
            kResutrantScrean: (context) => const ResturantHomeScrean(),
          },
          home: const CustomSplashScreanWidget(),
          // Set the initial page
          theme: ThemeData(fontFamily: 'Roboto'),

          debugShowCheckedModeBanner: false,
        ));
  }
}
