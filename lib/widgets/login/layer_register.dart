import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/user_repository_impl.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/admin_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../screens/userScreen/user_screen.dart';
import '../../theme/login_theme.dart';

class LayerRegister extends StatefulWidget {
  const LayerRegister({Key? key}) : super(key: key);

  @override
  State<LayerRegister> createState() => _LayerRegisterState();
}

class _LayerRegisterState extends State<LayerRegister> {
  late String _fullname;
  late String _username;
  late String _passwork;
  late String _comfirmPasswork;
  late String _gmail;

  late String _errWrong = "";

  // late UserRepository allUser = new UserRepositoryImpl();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final recipeData = Provider.of<UserProvider>(context);

    _register(User user) async {
      await recipeData.addUser(user);
      Navigator.pop(context);
    }

    ;

    return SingleChildScrollView(
      child: Container(
          height: 584,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(left: 50, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'full name',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      _fullname = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter User ID or Email',
                      hintStyle: TextStyle(color: LoginTheme.hintText),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Username',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      _username = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter User ID or Email',
                      hintStyle: TextStyle(color: LoginTheme.hintText),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Passwork',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      _passwork = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter Passwork',
                      hintStyle: TextStyle(color: LoginTheme.hintText),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      _comfirmPasswork = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Comfirm Passwork',
                      hintStyle: TextStyle(color: LoginTheme.hintText),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Gmail',
                  style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    onChanged: (value) {
                      _gmail = value;
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Enter gmail',
                      hintStyle: TextStyle(color: LoginTheme.hintText),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Container(
                    width: 99,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: LoginTheme.signInButton,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_passwork == _comfirmPasswork) {
                            User user = User(
                                fullname: _fullname,
                                username: _username,
                                passwork: _passwork,
                                gmail: _gmail,
                                role: "ROLE_USER");

                            _register(user);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Passwork and confirm Pass dissimilarity")));
                          }
                        },
                        child: const Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Poppins-Medium',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

 
}
