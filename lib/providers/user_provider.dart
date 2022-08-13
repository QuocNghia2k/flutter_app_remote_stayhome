import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/user_repository_impl.dart';

import '../data/dataSource/entiti/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _ListUser = [];
  User _user = User();
  UserRepository userRepository = UserRepositoryImpl();

  List<User> get listUser {
    return _ListUser;
  }

  User get user {
    return _user;
  }

  UserProvider() {
    _init();
  }
  _init() async {
    _ListUser = await userRepository.getAllUser();
    notifyListeners();
  }

  Future getUser(String userName, String passwork) async {
    for (var user in _ListUser) {
      if (user.username == userName && user.passwork == passwork) {
        _user = user;
      }
    }
    notifyListeners();
  }

  Future addUser(User user) async {
    userRepository.addUser(user);
    _init();
    notifyListeners();
  }
}
