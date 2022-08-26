import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailUser extends StatefulWidget {
  final User user;
  const DetailUser({Key? key, required this.user}) : super(key: key);

  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${widget.user.fullname}"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(140),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                      radius: 120,
                      backgroundImage: widget.user.idProfilePictrure == null
                          ? const NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                          : NetworkImage("${widget.user.idProfilePictrure}"))),
              SizedBox(
                height: 20,
              ),
              Text(
                "${widget.user.fullname}",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 18,
              ),
              Text("${widget.user.fullname}"),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 75, 197, 140)),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      " work day: 28",
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.linkedin),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 143, 177, 223)),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "salary: 1000\$",
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  ElevatedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      ),
                    ),
                    label: Text(
                      "Day off: 2",
                    ),
                  ),
                  SizedBox(
                    width: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
