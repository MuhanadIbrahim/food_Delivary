import 'package:food_delivery_app/my_user/user.dart';

abstract class UserRepository {
  Future<MyUser> signUp(MyUser user, String password);
  Future<void> signIn(String email, String password);
  Future<void> logOut();
  Future<void> resetPassword(String email);
}
