import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/dataSource/entiti/user.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late User? user;
  CustomAppBar({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/menu.svg')),
            CircleAvatar(
                backgroundImage: user!.idProfilePictrure == null?
                const NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"):
                NetworkImage("${user!.idProfilePictrure}"))
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
