import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/dataSource/entiti/post.dart';
import '../../data/dataSource/entiti/user.dart';
import '../../providers/post_provider.dart';
import '../../providers/user_provider.dart';

class PostPageInUser extends StatefulWidget {
  const PostPageInUser({Key? key}) : super(key: key);

  @override
  State<PostPageInUser> createState() => _PostPageInUserState();
}

class _PostPageInUserState extends State<PostPageInUser> {
  @override
  Widget build(BuildContext context) {
    PostProvider postProvider = Provider.of<PostProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    List<Post> _listOfOffer = postProvider.list;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/primaryBg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
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
      ),
    );
  }
}
