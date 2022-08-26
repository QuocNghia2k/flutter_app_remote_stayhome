import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:provider/provider.dart';

class ItemDivile extends StatefulWidget {
  int index;
  ItemDivile({Key? key, required this.index}) : super(key: key);

  @override
  State<ItemDivile> createState() => _ItemDivileState();
}

class _ItemDivileState extends State<ItemDivile> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    List<DivileHouse> list = homeProvider.listDivile;
    return Container(
      child: SwitchListTile(
        title: Text("Lamp"),
        value: isOn,
        onChanged: (value) {
          setState(() {
            isOn = value;
          });
        },
      ),
    );
  }
}
