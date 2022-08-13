import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';

// import '../../../widgets/userPage/home/custom_app_bar.dart';

class PostAdd extends StatefulWidget {
  late User? user;
   PostAdd({Key? key, required User user}) : super(key: key);

  @override
  State<PostAdd> createState() => _PostAppState();
}

class _PostAppState extends State<PostAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      
    );
  }

  
}
