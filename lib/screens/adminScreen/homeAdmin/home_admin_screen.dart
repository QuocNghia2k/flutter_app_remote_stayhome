import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/homeAdmin/add_post.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/homeAdmin/post_screen.dart';

import '../../../data/dataSource/entiti/user.dart';

class HomeAdminScrren extends StatelessWidget {
  const HomeAdminScrren({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/primaryBg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: PostScreen(
                user: user,
              ))),
    );
  }
}
