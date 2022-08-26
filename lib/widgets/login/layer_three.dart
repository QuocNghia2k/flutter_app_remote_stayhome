import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/admin_screen.dart';
import 'package:flutter_app_remote_stayhome/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../../screens/userScreen/user_screen.dart';
import '../../theme/login_theme.dart';

class LayerThree extends StatefulWidget {
  const LayerThree({Key? key}) : super(key: key);

  @override
  State<LayerThree> createState() => _LayerThreeState();
}
class _LayerThreeState extends State<LayerThree> {
  late String _username;
  late String _passwork;
  late String _errWrong = "";
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final recipeData = Provider.of<UserProvider>(context);

    _login(String username, String passwork) async {
      await recipeData.getUser(username, passwork);
      // print(context.watch<UserProvider>().user.toString());
      if (recipeData.user.role == "ROLE_USER" ||
          recipeData.user.role == "ROLE_ADMIN") {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => recipeData.user.role == "ROLE_USER"
                  ? UserScreen(
                      user: recipeData.user,
                    )
                  : AdminScrren(
                      user: recipeData.user,
                    )),
        );
      } else {
        setState(() {});
      }
    }

    return Container(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 129,
              child: SizedBox(
                width: 310,
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
              )),
          const Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 229,
              child: SizedBox(
                width: 310,
                child: TextFormField(
                  onChanged: (value) {
                    _passwork = value;
                  },
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: 'Enter Password',
                    errorText: _errWrong,
                    hintStyle: TextStyle(color: LoginTheme.hintText),
                  ),
                ),
              )),
          Positioned(
              right: 60,
              top: 296,
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: LoginTheme.forgotPasswordText,
                      fontSize: 16,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w600),
                ),
              )),
          Positioned(
              left: 87,
              top: 365,
              child: GestureDetector(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ));
                }),
                child: Container(
                  width: 99,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: LoginTheme.signInButton,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 365,
              right: 60,
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
                      print("$_passwork+ $_username");
                      _login(_username, _passwork);
                    },
                    child: const Text(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 432,
              left: 59,
              child: Container(
                height: 0.5,
                width: 310,
                color: LoginTheme.inputBorder,
              )),
          Positioned(
              top: 482,
              left: 120,
              right: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: LoginTheme.signInBox),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'assets/images/icon_google.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                        color: LoginTheme.hintText),
                  ),
                  Container(
                    width: 59,
                    height: 48,
                    decoration: BoxDecoration(
                        border: Border.all(color: LoginTheme.signInBox),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Image.asset(
                      'assets/images/icon_apple.png',
                      width: 20,
                      height: 21,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  // Future<User> _checkPasswork(String passwork, String userName) async {
  //   List<User> getAllUser = await allUser.getAllUser();
  //   for (var user in getAllUser) {
  //     if (user.username == userName && user.passwork == passwork) {
  //       return user;
  //     }
  //   }
  //   return User();
  // }
}
