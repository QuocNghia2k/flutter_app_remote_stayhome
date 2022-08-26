import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/booking.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../data/dataSource/entiti/house.dart';
import '../../widgets/userPage/circle_icon_button.dart';
import 'detail_screen.dart';

class LikesScreen extends StatefulWidget {
  final User user;
  const LikesScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  List<House> list = [];
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    List<House> _listOfOffer = homeProvider.listHouse;
    list.addAll(_listOfOffer);
    homeProvider.findBookingInId(widget.user.id!);
    List<Booking> _listBooking = homeProvider.listBokkingInId;

    NetworkImage _findImageHouse(String id) {
      list.toString();
      for (var house in list) {
        if (house.id == id) {
          return NetworkImage("${house.idImage}");
        }
      }
      return NetworkImage("");
    }

    House _findHouse(String id) {
      for (var house in list) {
        if (house.id == id) {
          return house;
        }
      }
      return House();
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/primaryBg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ..._listBooking
                        .map((el) => GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => DetailPage(
                                //         house: el, user: widget.user)));
                              },
                              // child: Text(el.idHouse!),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 80,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: _findImageHouse(
                                                      "${el.idHouse}"),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Text(
                                              "The Moon House",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "P455, Chhatak, Sylhet",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 12),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "start date: ${el.startDate!.day}/${el.startDate!.month}/${el.startDate!.year}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 12),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "End date: ${el.endDate!.day}/${el.endDate!.month}/${el.endDate!.year}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Positioned(
                                      right: 0,
                                      child: CircleIconButton(
                                        iconUrl: 'assets/icons/heart.svg',
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
