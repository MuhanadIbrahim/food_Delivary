import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/Flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constans/constans.dart';
import 'Custom_TextFormField_sign_in.dart';
import 'custom_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreanBodyContent extends StatefulWidget {
  LoginScreanBodyContent({super.key});

  @override
  State<LoginScreanBodyContent> createState() => _LoginScreanBodyContentState();
}

class _LoginScreanBodyContentState extends State<LoginScreanBodyContent> {
  String? Email;

  String? password;

  GlobalKey<FormState> formkey = GlobalKey();

  bool signInRequired = false;

  Future signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential

    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    Navigator.pushReplacementNamed(context as BuildContext, kHomeScrean);
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacementNamed(context as BuildContext, kHomeScrean);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
        } else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset('assets/images/AppLogo1.jpg'),
                  SvgPicture.asset(
                      'assets/images/login to your account login screan.svg'),
                  CustomTextFormFieldForEmail(
                    onchanged: (value) {
                      Email = value;
                    },
                  ),
                  CustomTextFormFieldForPassword(
                    onchanged: (value) {
                      password = value;
                    },
                  ),
                  SvgPicture.asset('assets/images/or continue LoginScrean.svg'),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              signInWithFacebook();
                              // Navigator.pushReplacementNamed(
                              //     context as BuildContext, kHomeScrean);
                            },
                            child: SvgPicture.asset(
                              'assets/images/Facebook Button.svg',
                              width: 50,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              signInWithGoogle();
                            },
                            child: SvgPicture.asset(
                              'assets/images/Google Button.svg',
                              width: 50,
                              height: 100,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          left: MediaQuery.of(context).size.width / 3,
                          bottom: MediaQuery.of(context).size.height / 25,
                          child: GestureDetector(
                            onTap: () async {
                              if (Email.toString() == '') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Rest password failed',
                                  desc: "Please enter your email ",
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              }
                              try {
                                FirebaseAuth.instance.sendPasswordResetEmail(
                                    email: Email.toString());
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  animType: AnimType.rightSlide,
                                  title: 'Rest password link Send',
                                  desc: "Please Check your email ",
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              } catch (e) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Rest password process fialed',
                                  desc: "Please enter avalid  email ",
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                                if (kDebugMode) {
                                  print(e);
                                }
                              }
                            },
                            child: SvgPicture.asset(
                                'assets/images/Forgot Password Link.svg'),
                          )),
                    ],
                  ),
                  !signInRequired
                      ? GestureDetector(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              context.read<SignInBloc>().add(SignInRequired(
                                  Email.toString(), password.toString()));
                            //  Navigator.pushNamed(context, kHomeScrean);
                            }
                          },
                          child: const CustomButton(title: 'Login'),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String parseFirebaseAuthExceptionMessage(
      {String plugin = "auth", required String? input}) {
    if (input == null) {
      return "unknown";
    }

    // https://regexr.com/7en3h
    String regexPattern = r'(?<=\(' + plugin + r'/)(.*?)(?=\)\.)';
    RegExp regExp = RegExp(regexPattern);
    Match? match = regExp.firstMatch(input);
    if (match != null) {
      return match.group(0)!;
    }

    return "unknown";
  }
}
