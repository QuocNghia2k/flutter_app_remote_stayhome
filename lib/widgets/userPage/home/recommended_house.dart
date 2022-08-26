import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../data/dataSource/entiti/house.dart';
import '../../../data/dataSource/entiti/user.dart';
import '../../../data/repositories/house_repository.dart';
import '../../../screens/userScreen/detail_screen.dart';
import '../circle_icon_button.dart';

class RecommendedHouse extends StatefulWidget {
  final User user;
  RecommendedHouse({Key? key, required this.user}) : super(key: key);

  @override
  State<RecommendedHouse> createState() => _RecommendedHouseState();
}

class _RecommendedHouseState extends State<RecommendedHouse> {
  @override
  Widget build(BuildContext context) {
    final listOffer = Provider.of<HomeProvider>(context).listHouse;

    return listOffer.isEmpty
        ? Container(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.all(15),
            height: 340,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailPage(
                            house: listOffer[index],
                            user: widget.user,
                          );
                        }));
                      },
                      child: Container(
                        width: 230,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Stack(
                          children: [
                            Container(
                              child: Expanded(
                                  child: Image.network(
                                listOffer[index].idImage!
                                // "https://firebasestorage.googleapis.com/v0/b/flutter-app-homestay.appspot.com/o/image%2FHouses%2Fhouse01.jpeg?alt=media&token=98cd65f4-af2f-498f-8c47-7e6c6adcdd83"
                                ,
                                fit: BoxFit.cover,
                                height: double.infinity,
                                width: double.infinity,
                              )),
                            ),
                            Positioned(
                              right: 15,
                              top: 15,
                              child: CircleIconButton(
                                  iconUrl: 'assets/icons/mark.svg',
                                  color: Theme.of(context).accentColor),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.white54,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(listOffer[index].name!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            listOffer[index].address!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      CircleIconButton(
                                          iconUrl: 'assets/icons/mark.svg',
                                          color: Theme.of(context).accentColor)
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemCount: listOffer.length),
          );
  }
}
