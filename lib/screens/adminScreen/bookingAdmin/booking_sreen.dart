import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/bookingAdmin/post_add_screen.dart';

import 'custem_list_view.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int currentSelect = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => PostAddScren()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/primaryBg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            // padding: const EdgeInsets.all(8.0),
            itemExtent: 106.0,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CustomListItem(
                      user: 'Flutter',
                      viewCount: 999000,
                      thumbnail: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/primaryBg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: 'The Flutter YouTube Channel',
                    ),
                  ),
                ),
            itemCount: 5),
      ),
    );
    ;
  }
}
