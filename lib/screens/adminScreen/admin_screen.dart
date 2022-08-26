import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/providers/post_provider.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/bookingAdmin/booking_sreen.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/bookingAdmin/chectOut.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/homeAdmin/home_admin_screen.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/user_edit_screem.dart/user_edit_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import '../../widgets/userPage/home/custom_app_bar.dart';

class AdminScrren extends StatefulWidget {
  User user;
  AdminScrren({Key? key, required this.user}) : super(key: key);
  @override
  State<AdminScrren> createState() => _AdminScrrenState();
}

class _AdminScrrenState extends State<AdminScrren> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  late List<Widget> _widgetOptions = [
    HomeAdminScrren(
      user: widget.user,
    ),
    BookingScreen(),
    UserEditScreen(),
    CheckOut(),
  ];

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
          child: _widgetOptions.elementAt(_selectedIndex),
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
                  text: 'House',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'User',
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: 'Profile',
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
