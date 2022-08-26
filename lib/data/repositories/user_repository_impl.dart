import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/service/user_service.dart';

abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<User> getUser(String id);
  Future<String> checkUser(String userNaem, String passwork);
  Future addUser(User user);
  Future updateUser(User user);
}

class UserRepositoryImpl implements UserRepository {
  late UserService userService;

  UserRepositoryImpl() {
    userService = UserService();
  }
  @override
  Future<List<User>> getAllUser() async {
    return userService.getAllUser();
  }

  @override
  Future<User> getUser(String id) async {
    return await userService.getUser(id);
  }

  @override
  Future<String> checkUser(String userName, String passwork) {
    return userService.checkUser(userName, passwork);
  }

  @override
  Future addUser(User user) async {
    await userService.addUser(user);
  }

  @override
  Future updateUser(User user) async {
    userService.updateUser(user);
  }
}
