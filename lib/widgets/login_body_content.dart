import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return Padding(
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
                GestureDetector(
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: Email.toString(),
                                password: password.toString());
                        if (userCredential.user!.emailVerified) {
                          Navigator.pushReplacementNamed(context, kHomeScrean);
                        } else {
                          // ignore: use_build_context_synchronously
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.error,
                            animType: AnimType.rightSlide,
                            title: 'Login failed',
                            desc:
                                "Please activate your account by clicking the link in your email.",
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {},
                          ).show();
                        }
                      } on FirebaseAuthException catch (e) {
                        // Temporary Fix
                        final code =
                            parseFirebaseAuthExceptionMessage(input: e.message);
                        switch (code) {
                          case 'wrong-password':
                            Fluttertoast.showToast(
                                msg: 'wrong-password',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            break;
                          case 'user-not-found':
                            Fluttertoast.showToast(
                                msg: 'user-not-found',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            break;
                          case 'user-disabled':
                            Fluttertoast.showToast(
                                msg: 'user-disabled',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            break;
                          case 'too-many-requests':
                            Fluttertoast.showToast(
                                msg: 'too-many-requests',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            break;
                          case 'network-request-failed':
                            Fluttertoast.showToast(
                                msg: 'Too Many Request',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                            break;
                          default:
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Login failed',
                              desc: "Please check your email and password",
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                        }
                      } catch (error) {
                        Fluttertoast.showToast(
                            msg: 'Something is not right.',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }
                  },
                  child: const CustomButton(title: 'Login'),
                ),
              ],
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
