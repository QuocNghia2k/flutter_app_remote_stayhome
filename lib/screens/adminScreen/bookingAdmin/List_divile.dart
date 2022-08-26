import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/house.dart';
import 'package:flutter_app_remote_stayhome/providers/home_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/adminScreen/bookingAdmin/item_divile.dart';
import 'package:provider/provider.dart';

class ListDivle extends StatefulWidget {
  final House house;

  const ListDivle({
    Key? key,
    required this.house,
  }) : super(key: key);

  @override
  State<ListDivle> createState() => _ListDivleState();
}

class _ListDivleState extends State<ListDivle> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    List<DivileHouse> _listOfOffer = homeProvider.listDivile;

    // _addPostInDb(DivileHouse post) async {
    //   await homeProvider.addDivile(post);
    // }

    // Widget _addPost() {
    //   return Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white, borderRadius: BorderRadius.circular(10)),
    //     child: Form(
    //       key: _formKey,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           TextFormField(
    //             decoration:
    //                 InputDecoration(prefixIcon: const Icon(Icons.post_add)),
    //             // The validator receives the text that the user has entered.
    //             validator: (value) {
    //               if (value == null || value.isEmpty) {
    //                 return 'Please enter some text+ ';
    //               }
    //               setState(() {
    //                 DivileHouse post = DivileHouse(
    //                     idHouse: widget.house.id,
    //                     nameDivile: value,
    //                     isOn: false);
    //                 _addPostInDb(post);
    //               });
    //               return null;
    //             },
    //           ),
    //           Center(
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 10),
    //               child: ElevatedButton(
    //                 onPressed: () {
    //                   if (_formKey.currentState!.validate()) {
    //                     ScaffoldMessenger.of(context).showSnackBar(
    //                       const SnackBar(content: Text('Processing Data')),
    //                     );
    //                   }
    //                 },
    //                 child: const Text('Submit'),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.house.name!),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _listOfOffer.length - 1,
          itemBuilder: (context, index) {
            return ItemDivile(index: index);
          },
        ),
      ),
    );
  }
}
