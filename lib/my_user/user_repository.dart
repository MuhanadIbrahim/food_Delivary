import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/my_user/user.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<MyUser> signUp(MyUser user, String password);

  Future<bool> signIn(String email, String password);

  Future<void> logOut();

  Future<void> resetPassword(String email);

  Future<void> setUserData(MyUser user);

  Future<MyUser> getMyUser(String myUserId);

  Future<String> uploadPicture(String file, String userId);
}
