import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/image.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/house_repository.dart';
// import 'package:flutter_app_remote_stayhome/data/repositories/user_repository_impl.dart';
import '../../../data/dataSource/entiti/house.dart';
import '../../../data/dataSource/entiti/user.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key, required this.user}) : super(key: key);
  late User user;
  @override
  State<PostScreen> createState() => _PostScrrenState();
}

class _PostScrrenState extends State<PostScreen> {
  
  List<House> _listOfOffer = House.generateBestOffer();

  

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          _addPost(),
          const SizedBox(height: 10),
          ..._listOfOffer
              .map(
                (el) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.jpeg"),
                    ),
                    title: Text(el.name!),
                    subtitle: Text(el.address!),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }

  Widget _addPost() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration:
                  InputDecoration(prefixIcon: const Icon(Icons.post_add)),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text+ ';
                }
                setState(() {
                  _listOfOffer.insert(
                      0,
                      House(
                          id: _listOfOffer.length + 1,
                          name: "${widget.user.fullname}",
                          address: "$value",
                          idImage: "assets/images/avatar.jpeg"));
                  value == "";
                });
                return null;
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
