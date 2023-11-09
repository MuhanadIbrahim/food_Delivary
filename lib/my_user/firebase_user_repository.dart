import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_app/my_user/user.dart';
import 'package:food_delivery_app/my_user/user_entity.dart';
import 'package:food_delivery_app/my_user/user_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constans/constans.dart';


class FirebaseUserRepository implements UserRepository {
  final userCollection = FirebaseFirestore.instance.collection('users');
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: myUser.email, password: password);

      myUser = myUser.copyWith(id: user.user?.uid);

      FirebaseAuth.instance.currentUser!.sendEmailVerification();

      return myUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('=========The password provided is too weak.');

        // AwesomeDialog(
        //   context: context,
        //   dialogType: DialogType.error,
        //   animType: AnimType.rightSlide,
        //   title: 'weak-password',
        //   desc: 'The password provided is too weak.',
        //   btnCancelOnPress: () {},
        //   btnOkOnPress: () {},
        // ).show();
        Fluttertoast.showToast(
            msg: "The password provided is too weak.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if (e.code == 'email-already-in-use') {
        print('==========The account already exists for that email.');
        // AwesomeDialog(
        //   context: context,
        //   dialogType: DialogType.error,
        //   animType: AnimType.rightSlide,
        //   title: 'mail-already-in-use',
        //   desc: 'The account already exists for that email.',
        //   btnCancelOnPress: () {},
        //   btnOkOnPress: () {},
        // ).show();
        Fluttertoast.showToast(
            msg: "The account already exists for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print(
    //         '=======================================No user found for that email.');
    //     Fluttertoast.showToast(
    //         msg: 'No user found for that email.',
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   } else if (e.code == 'wrong-password') {
    //     print(
    //         '========================================Wrong password provided for that user.');
    //     Fluttertoast.showToast(
    //         msg: 'Wrong password provided for that user.',
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.red,
    //         textColor: Colors.white,
    //         fontSize: 16.0);
    //   }
    // }
    try {
      // UserCredential userCredential =
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      

      // if (userCredential.user!.emailVerified) {
      // } else {
      //   // ignore: use_build_context_synchronously
      //   // AwesomeDialog(
      //   //   context: context,
      //   //   dialogType: DialogType.error,
      //   //   animType: AnimType.rightSlide,
      //   //   title: 'Login failed',
      //   //   desc:
      //   //       "Please activate your account by clicking the link in your email.",
      //   //   btnCancelOnPress: () {},
      //   //   btnOkOnPress: () {},
      //   // ).show();
      //   Fluttertoast.showToast(
      //       msg:
      //           'Please activate your account by clicking the link in your email.',
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }
    } on FirebaseAuthException catch (e) {
      // Temporary Fix
      final code = parseFirebaseAuthExceptionMessage(input: e.message);
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
          // AwesomeDialog(
          //   context: context,
          //   dialogType: DialogType.error,
          //   animType: AnimType.rightSlide,
          //   title: 'Login failed',
          //   desc: "Please check your email and password",
          //   btnCancelOnPress: () {},
          //   btnOkOnPress: () {},
          // ).show();
          Fluttertoast.showToast(
              msg: 'Please check your email and password',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
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

  @override
  Future<void> logOut() async {
    try {
      await GoogleSignIn().disconnect();
      print('=================user Google   Sign Out !');
      // ignore: use_build_context_synchronously
    } catch (e) {
      print('failed to disconnect on signout $e');
    }
    try {
      await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
    print('not work ');

    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
      print('=================user firebase  Sign Out !');
      // ignore: use_build_context_synchronously
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.success,
      //   animType: AnimType.rightSlide,
      //   title: 'Rest password link Send',
      //   desc: "Please Check your email ",
      //   btnCancelOnPress: () {},
      //   btnOkOnPress: () {},
      // ).show();
      Fluttertoast.showToast(
          msg: "Rest password link Send",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      // AwesomeDialog(
      //   context: context,
      //   dialogType: DialogType.error,
      //   animType: AnimType.rightSlide,
      //   title: 'Rest password process fialed',
      //   desc: "Please enter avalid  email ",
      //   btnCancelOnPress: () {},
      //   btnOkOnPress: () {},
      // ).show();
      Fluttertoast.showToast(
          msg: "Please enter avalid  email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      if (kDebugMode) {
        print(e);
      }
    }
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

  @override
  Future<MyUser> getMyUser(String myUserId) {
    try {
      return userCollection.doc(myUserId).get().then((value) =>
          MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUser user) async {
    try {
      await userCollection.doc(user.id).set(user.toEntity().toDocument());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Stream<User?> get user {
    return FirebaseAuth.instance.authStateChanges().map((firebaseUser) {
      final user = firebaseUser;
      return user;
    });
  }
}
