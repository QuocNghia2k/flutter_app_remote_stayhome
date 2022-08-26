import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/booking.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/house.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/userScreen/user_screen.dart';
import 'package:provider/provider.dart';

class BooKingUserScreen extends StatefulWidget {
  final User user;
  final House house;
  const BooKingUserScreen({Key? key, required this.user, required this.house})
      : super(key: key);

  @override
  State<BooKingUserScreen> createState() => _BooKingUserScreenState();
}

class _BooKingUserScreenState extends State<BooKingUserScreen> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    _addBooking(Booking booking) async {
      await homeProvider.addBooking(booking);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserScreen(user: widget.user),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
        centerTitle: true,
      ),
      body: Center(
        // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "start date: ${startDate.day}/${startDate.month}/${startDate.year}",
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: () async {
                    DateTime? newdate = await showDatePicker(
                        context: context,
                        initialDate: startDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    if (newdate == null) return;
                    setState(() {
                      startDate = newdate;
                    });
                  },
                  child: const Text("select start date")),
              SizedBox(
                height: 20,
              ),
              Text(
                "start date: ${endDate.day}/${endDate.month}/${endDate.year}",
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: () async {
                    DateTime? newdate = await showDatePicker(
                        context: context,
                        initialDate: endDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));

                    if (newdate == null) return;
                    setState(() {
                      endDate = newdate;
                    });
                  },
                  child: const Text("select end date")),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () {
                    Booking booking = Booking(
                        idUser: widget.user.id,
                        idHouse: widget.house.id,
                        startDate: startDate,
                        endDate: endDate);
                    _addBooking(booking);
                  },
                  child: const Text("Booking")),
            ]),
      ),
    );
  }
}
