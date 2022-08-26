import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../data/dataSource/entiti/user.dart';
import '../../widgets/userPage/home/best_offer.dart';
import '../../widgets/userPage/home/categories.dart';
import '../../widgets/userPage/home/recommended_house.dart';
import '../../widgets/userPage/home/search_input.dart';
import '../../widgets/userPage/home/welcome_text.dart';

class HomePage extends StatefulWidget {
  User user;
  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      // appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomeProvider(),)
          ],
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/primaryBg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeText(),
                SearchInput(),
                Categories(),
                RecommendedHouse(
                  user: widget.user,
                ),
                BestOffer(
                  user: widget.user,
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
