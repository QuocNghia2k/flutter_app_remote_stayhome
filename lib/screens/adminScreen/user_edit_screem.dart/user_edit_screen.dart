import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/user_edit_screem.dart/item_user.dart';
import 'package:provider/provider.dart';

import '../../../data/dataSource/entiti/user.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen({Key? key}) : super(key: key);

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    List<User> listUser = userProvider.listUser;
    return Scaffold(
      // body: SingleChildScrollView(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/primaryBg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: userProvider.listUser.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listUser.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ItemUser(idUser: index),
                    ),
                  );
                },
              ),
      ),
      // ),
    );
  }
}
