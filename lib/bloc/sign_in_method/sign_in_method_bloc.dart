import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_in_method_event.dart';
part 'sign_in_method_state.dart';

class SignInMethodBloc extends Bloc<SignInAllMethodEvent, SignInMethodState> {
  SignInMethodBloc() : super(SignInMethodInitial()) {
    on<SignInAllMethodEvent>((event, emit) async {
      final User user = FirebaseAuth.instance.currentUser!;

      if (user != null) {
        final String providerId = user.providerData[0].providerId;

        if (providerId == 'facebook.com') {
          print('user sign in by +++++++++++++++++++++ facebook');
          var userData = await FacebookAuth.instance.getUserData();
          Map<String, dynamic> _userData;
          _userData = userData;

          emit(SignInMethodFacebook(
              userName: _userData["name"],
              imageUrl: _userData["picture"]["data"]["url"]));
        } else if (providerId == 'google.com') {
          GoogleSignIn _googleSignIn = GoogleSignIn();
          FirebaseAuth _auth = FirebaseAuth.instance;
          print('user sign in by +++++++++++++++++++++++google');
          GoogleSignInAccount? googleSignInAccount =
              await _googleSignIn.signIn();
          if (googleSignInAccount == null) {
            return null;
          }

          GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);

          try {
            final UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            // userCredential.user.displayName;
            print(userCredential.user!.photoURL.toString());
            print(userCredential.user!.displayName.toString());
            emit(SignInMethodGoogle(
                imageUrl: userCredential.user!.photoURL.toString(),
                userName: userCredential.user!.displayName.toString()));
          } on FirebaseAuthException catch (e) {
            // Handle errors here
            print(e.code);
            return null;
          }

          // Display user's name and image

          // User signed in with Google
        } else if (providerId == 'password') {
          print(
              'user sign in by ++++++++++++++++++++++++++++++email and password');
          emit(SignInMethodEmailPassword());
          // User signed in with email and password
        } else {
          print('user sign in ++++++++++++++++other way');
          // Handle other sign-in methods (if relevant)
        }
      } else {
        print('user is not ++++++++++++++++++++++++++++sign in ');
        // User is not currently signed in
        emit(SignInMethodFailed());
      }
    });
  }
}
