import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/user_edit_screem.dart/detail_user.dart';
import 'package:provider/provider.dart';

import '../../../data/dataSource/entiti/user.dart';
import '../../../providers/user_provider.dart';

class ItemUser extends StatefulWidget {
  final int idUser;

  ItemUser({
    Key? key,
    required this.idUser,
  }) : super(key: key);

  @override
  State<ItemUser> createState() => _ItemUserState();
}

class _ItemUserState extends State<ItemUser> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.listUser[widget.idUser];
    isChecked = user.role == "ROLE_ADMIN" ? true : false;
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailUser(user: user),
            ));
      },
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 216, 215, 215)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundImage: user.idProfilePictrure == null
                      ? const NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                      : NetworkImage(user.idProfilePictrure!),
                ),
              ),
              Expanded(
                flex: 3,
                child: _VideoDescription(
                  user: user.fullname!,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Text("Admin"),
                      Checkbox(
                        value: isChecked ? true : false,
                        onChanged: (value) {
                          setState(() {
                            String role = "";
                            if (value!) {
                              role = "ROLE_ADMIN";
                            } else {
                              role = "ROLE_USER";
                            }
                            isChecked = value;
                            user.role = role;
                            userProvider.updateUser(user);
                          });
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.user,
  }) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}
