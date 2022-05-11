import './user.dart';

abstract class UserRepository {
  User getUser();

  void saveUser(User user);
}
