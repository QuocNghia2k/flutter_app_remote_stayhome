import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:flutter_app_remote_stayhome/widgets/login/layer_register.dart';
import 'package:provider/provider.dart';

import '../widgets/login/layer_one.dart';
import '../widgets/login/layer_three.dart';
import '../widgets/login/layer_two.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/primaryBg.png'),
          fit: BoxFit.cover,
        )),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 200,
                left: 59,
                child: Container(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Poppins-Medium',
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
            Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
            MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => UserProvider(),
                )
              ],
              child: 
              Positioned(
                top: 320,
                right: 0,
                bottom: 48,
                child: LayerRegister(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
