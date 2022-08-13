import 'package:flutter/material.dart';

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
  // final HouseRepository houseRepository = HouseRepositoryImpl();
  final listOffer = House.generateRecommended();
  // late List<House>listOffer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // HouseRepository houseRepository = HouseRepositoryImpl();
    //  _getAllHouse();
    // listOffer = houseRepository.getAllHouse();
    // listOffer = House.generateRecommended();
  }

  // _getAllHouse() async {
  //   listOffer = await houseRepository.getAllHouse();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  listOffer[index].idImage!,
                                ),
                                fit: BoxFit.cover)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(listOffer[index].name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
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
                                              fontWeight: FontWeight.bold),
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
          separatorBuilder: (_, index) => SizedBox(width: 20),
          itemCount: listOffer.length),
    );
  }
}
