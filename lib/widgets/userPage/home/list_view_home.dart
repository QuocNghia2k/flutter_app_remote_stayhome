import 'package:flutter/material.dart';

import '../../../data/dataSource/entiti/house.dart';
import '../circle_icon_button.dart';

class ListViewHome extends StatefulWidget {
  final List<House> listViewHouse;
  const ListViewHome({Key? key, required this.listViewHouse}) : super(key: key);

  @override
  State<ListViewHome> createState() => _ListViewHomeState();
}

class _ListViewHomeState extends State<ListViewHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                _buiderListViewHouse(widget.listViewHouse)
              ],
            ),
          )
        ],
      ),
    );
  }

  ListView _buiderListViewHouse(List<House> el) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(el[index].idImage!),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          el[index].name!,
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          el[index].address!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: CircleIconButton(
                    iconUrl: 'assets/icons/heart.svg',
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: el.length);
  }
}
