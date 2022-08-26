import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/bookingAdmin/List_divile.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/bookingAdmin/post_add_screen.dart';
import 'package:provider/provider.dart';

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
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    List<DivileHouse> listDiv = homeProvider.listDivile;
    List<DivileHouse> _getListDivileInId(String idHouse) {
      List<DivileHouse> listinId = [];
      for (var divider in listDiv) {
        if (divider.idHouse == idHouse) {
          listinId.add(divider);
        }
      }
      return listinId;
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => MultiProvider(providers: [
                      ChangeNotifierProvider(
                        create: (context) => HomeProvider(),
                      )
                    ], child: PostAddScren())),
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
            itemExtent: 106.0,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    List<DivileHouse> list =
                        _getListDivileInId(homeProvider.listHouse[index].id!);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                  create: (context) => HomeProvider(),
                                )
                              ],
                              child: ListDivle(
                                house: homeProvider.listHouse[index],
                              )),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CustomListItem(
                      thumbnail: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Image.network(
                          homeProvider.listHouse[index].idImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: homeProvider.listHouse[index].name!,
                      sub: homeProvider.listHouse[index].address!,
                    ),
                  ),
                ),
            itemCount: homeProvider.listHouse.length),
      ),
    );
    ;
  }
}
