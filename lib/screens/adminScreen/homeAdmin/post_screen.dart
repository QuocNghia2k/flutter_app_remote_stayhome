import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/image.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/house_repository.dart';
import 'package:flutter_app_remote_stayhome/providers/post_provider.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_app_remote_stayhome/data/repositories/user_repository_impl.dart';
import '../../../data/dataSource/entiti/house.dart';
import '../../../data/dataSource/entiti/post.dart';
import '../../../data/dataSource/entiti/user.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key, required this.user}) : super(key: key);
  late User user;
  @override
  State<PostScreen> createState() => _PostScrrenState();
}

class _PostScrrenState extends State<PostScreen> {
  // List<Post> _listOfOffer = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    PostProvider postProvider = Provider.of<PostProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    List<Post> _listOfOffer = postProvider.list;
    _addPostInDb(Post post) async {
      postProvider.addPost(post);
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
                    Post post = Post(detail: value, idUser: widget.user.id);
                    _addPostInDb(post);
                    // _listOfOffer.insert(
                    //     0, Post(detail: value, idUser: widget.user.id));
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(children: [
        _addPost(),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _listOfOffer.length,
            itemBuilder: (context, index) {
              User user = userProvider.findUser(_listOfOffer[index].idUser!);
              return Container(
                  child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: user.idProfilePictrure == null
                      ? const NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                      : NetworkImage("${user.idProfilePictrure}"),
                ),
                title: Text("${user.fullname}"),
                subtitle: Text(
                  "${_listOfOffer[index].detail}",
                ),
              ));
            },
          ),
        ),
      ]),
      //   ],
      // ),
      // ),
    );
  }
}
