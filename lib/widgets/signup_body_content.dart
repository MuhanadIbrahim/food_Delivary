import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/bloc/sign_up/bloc/sign_up_bloc.dart';
import 'package:food_delivery_app/my_user/user.dart';

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

  String? name;

  bool obscurePassword = true;

  IconData iconPassword = Icons.visibility;

  bool signUpRequired = false;

  GlobalKey<FormState> formkey = GlobalKey();

  bool isKeepSignIn = false;

  bool isSendingEmail = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10, top: 10, bottom: 2),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            setState(() {
              signUpRequired = false;
              Navigator.pushNamed(context, kLoginScrean);
            });
          } else if (state is SignUpProcess) {
            setState(() {
              signUpRequired = true;
            });
          } else if (state is SignUpFailure) {
            setState(() {
              signUpRequired = false;
            });
          }
        },
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        onChanged: (value) {
                          name = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please fill the in this field';
                          } else if (value.length > 30) {
                            return 'name too long';
                          }
                          return null;
                        },
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
                          return null;
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
                        obscureText: obscurePassword,
                        onChanged: (value) {
                          password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                    if (obscurePassword) {
                                      iconPassword = Icons.visibility_off;
                                    } else {
                                      iconPassword = Icons.visibility;
                                    }
                                  });
                                },
                                icon: Icon(iconPassword)),
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isKeepSignIn = !isKeepSignIn;
                              print(isKeepSignIn.toString());
                            });
                            print('iskeepsign ${isKeepSignIn.toString()}');
                          },
                          child: CircleAvatar(
                              radius: 8,
                              backgroundColor: isKeepSignIn
                                  ? const Color(0xff14be77)
                                  : Colors.grey,
                              child: isKeepSignIn
                                  ? SvgPicture.asset(
                                      'assets/images/checksvg.svg')
                                  : SizedBox()),
                        ),
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSendingEmail = !isSendingEmail;
                              print(isSendingEmail.toString());
                            });
                            print('issendingEmail${isSendingEmail.toString()}');
                          },
                          child: CircleAvatar(
                              backgroundColor: isSendingEmail
                                  ? const Color(0xff14be77)
                                  : Colors.grey,
                              radius: 8,
                              child: isSendingEmail
                                  ? SvgPicture.asset(
                                      'assets/images/checksvg.svg')
                                  : SizedBox()),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Email Me About Special Pricing',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    !signUpRequired
                        ? GestureDetector(
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                MyUser myUser = MyUser.empty;
                                myUser = myUser.copyWith(
                                    email: Email.toString(),
                                    name: name.toString());

                                setState(() {
                                  context.read<SignUpBloc>().add(SignUpRequired(
                                      myUser, password.toString()));
                                });
                              }
                            },
                            child: const CustomButton(title: 'Create Account'))
                        : const CircularProgressIndicator(),
                    GestureDetector(
                        onTap: () => Navigator.pushNamed(context, kLoginScrean),
                        child: SvgPicture.asset(
                            'assets/images/Create Accalready have account.svg')),
                    SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
