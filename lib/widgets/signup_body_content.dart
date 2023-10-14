import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constans/constans.dart';
import 'custom_button.dart';

class SignUpBodyContent extends StatefulWidget {
  const SignUpBodyContent({super.key});

  @override
  State<SignUpBodyContent> createState() => _SignUpBodyContentState();
}

class _SignUpBodyContentState extends State<SignUpBodyContent> {
  String? Email;

  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 10.0, left: 10, top: 10, bottom: 10),
      child: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/AppLogo1.jpg'),
                const Text(
                  'Sign Up For Free',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Color(0x115a6cea),
                          spreadRadius: 25,
                          blurRadius: 50)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        hintText: 'Your Name',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Color(0x115a6cea),
                          spreadRadius: 25,
                          blurRadius: 50)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextFormField(
                    onChanged: (value) {
                      Email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Color(0x115a6cea),
                          spreadRadius: 25,
                          blurRadius: 50)
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                BorderSide(width: 2, color: Colors.grey)),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                        radius: 8,
                        backgroundColor: const Color(0xff14be77),
                        child: SvgPicture.asset('assets/images/checksvg.svg')),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Keep Me Signed In',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                        backgroundColor: const Color(0xff14be77),
                        radius: 8,
                        child: SvgPicture.asset('assets/images/checksvg.svg')),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Email Me About Special Pricing',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: Email.toString(),
                                  password: password.toString());
                          Navigator.pushReplacementNamed(context, kHomeScrean);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print(
                                '=========The password provided is too weak.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'weak-password',
                              desc: 'The password provided is too weak.',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          } else if (e.code == 'email-already-in-use') {
                            print(
                                '==========The account already exists for that email.');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'mail-already-in-use',
                              desc:
                                  'The account already exists for that email.',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            ).show();
                          }
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: const CustomButton(title: 'Create Account')),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, kLoginScrean),
                    child: SvgPicture.asset(
                        'assets/images/Create Accalready have account.svg')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
