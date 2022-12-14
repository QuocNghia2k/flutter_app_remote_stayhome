import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/screens/userScreen/detail_screen.dart';
import 'package:provider/provider.dart';

import '../../../data/dataSource/entiti/house.dart';
import '../../../data/repositories/house_repository.dart';
import '../../../providers/home_provider.dart';
import '../circle_icon_button.dart';

class BestOffer extends StatelessWidget {
  final User user;
  BestOffer({required this.user});
  // List<House> _listOfOffer =[];

  @override
  Widget build(BuildContext context) {
    List<House> listOfOffer = Provider.of<HomeProvider>(context).listHouse;
    return listOfOffer.isEmpty
        ? Container(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Offer',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See All',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ...listOfOffer
                    .map((el) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(house: el, user: user)));
                          },
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
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Image.network(
                                        el.idImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Text(
                                          el.name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          el.address!,
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
                    .toList()
              ],
            ),
          );
  }
}
