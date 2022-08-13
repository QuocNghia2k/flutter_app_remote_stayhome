import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/screens/userScreen/booking_user_screen.dart';


import '../../data/dataSource/entiti/house.dart';
import '../../data/dataSource/entiti/user.dart';
import '../../widgets/userPage/detail/about.dart';
import '../../widgets/userPage/detail/content_intro.dart';
import '../../widgets/userPage/detail/detail_app_bar.dart';
import '../../widgets/userPage/detail/house_info.dart';
import '../adminScreen/bookingAdmin/booking_sreen.dart';

class DetailPage extends StatelessWidget {
  final User user;
  final House house;
  const DetailPage({Key? key, required this.house, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailAppBar(house: house),
        const SizedBox(height: 20),
        ContentIntro(house: house),
        const SizedBox(height: 20),
        HouseInfo(),
        const SizedBox(height: 20),
        About(),
        const SizedBox(height: 25),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BooKingUserScreen(user:  user,),));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  primary: Theme.of(context).primaryColor,
                ),
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text('Book Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)))))
      ],
    )));
  }
}
