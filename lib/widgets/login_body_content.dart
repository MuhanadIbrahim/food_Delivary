import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constans/constans.dart';
import 'Custom_TextFormField_sign_in.dart';
import 'custom_button.dart';

class LoginScreanBodyContent extends StatelessWidget {
  LoginScreanBodyContent({super.key});
  String? Email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
      child: Form(
        key: formkey,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Facebook Button.svg',
                      width: 80,
                      height: 125,
                      fit: BoxFit.contain,
                    ),
                    SvgPicture.asset(
                      'assets/images/Google Button.svg',
                      width: 80,
                      height: 125,
                    ),
                  ],
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    bottom: MediaQuery.of(context).size.height / 25,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, kForgetPasswordScrean),
                      child: SvgPicture.asset(
                          'assets/images/Forgot Password Link.svg'),
                    )),
              ],
            ),
            GestureDetector(
              onTap: () async {
                if (formkey.currentState!.validate()) {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: Email.toString(),
                            password: password.toString());
                    Navigator.pushReplacementNamed(context, kHomeScrean);
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
