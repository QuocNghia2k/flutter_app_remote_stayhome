import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:flutter_app_remote_stayhome/screens/userScreen/detail_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../data/dataSource/entiti/house.dart';
import '../../data/repositories/house_repository.dart';
import '../../providers/home_provider.dart';
import '../../widgets/userPage/circle_icon_button.dart';
import '../../widgets/userPage/home/search_input.dart';

class SearchScreen extends StatefulWidget {
  final User user;
  const SearchScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    List<House> list = homeProvider.listHouse;
    List<House> _listOfOffer = homeProvider.listHouse;

    Widget _search() {
      return Container(
        padding: EdgeInsets.all(15),
        child: TextFormField(
          onFieldSubmitted: (value) {
            print(value);
            if (value.isNotEmpty) {
              List<House> listSearch = [];
              for (var house in list) {
                print(house.name);
                if (house.name!.contains(value)) {
                  listSearch.add(house);
                }
              }
              setState(() {
                _listOfOffer.clear();
                _listOfOffer.addAll(listSearch);
              });
            } else {
              _listOfOffer.clear();
              _listOfOffer.addAll(list);
            }
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: 'Search here ...',
              prefixIcon: Container(
                padding: EdgeInsets.all(15),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
              contentPadding: EdgeInsets.all(2)),
        ),
      );
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
              _search(),
              Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    ..._listOfOffer
                        .map((el) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                        house: el, user: widget.user)));
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
                                              image: DecorationImage(
                                                  image:
                                                      NetworkImage(el.idImage!),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
