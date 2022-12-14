import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:flutter_app_remote_stayhome/providers/post_provider.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../data/dataSource/entiti/user.dart';
import '../../widgets/userPage/home/custom_app_bar.dart';
import 'like_screen.dart';
import 'search_screen.dart';
import 'home_screen.dart';
import 'post_page.dart';

class UserScreen extends StatefulWidget {
  final User user;
  static final List<Widget> widgetOptions = [];
  UserScreen({Key? key, required this.user}) : super(key: key) {
    widgetOptions.addAll([
      HomePage(
        user: user,
      ),
      SearchScreen(user: user),
      LikesScreen(
        user: user,
      ),
      PostPageInUser(),
    ]);
  }
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        user: widget.user,
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PostProvider(),
          )
        ],
        child: Center(
          child: UserScreen.widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Booking',
                ),
                GButton(
                  icon: LineIcons.bell,
                  text: 'Notified',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
