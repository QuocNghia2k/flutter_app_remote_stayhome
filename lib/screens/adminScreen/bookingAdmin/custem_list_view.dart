import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem(
      {Key? key,
      required this.thumbnail,
      required this.title,
      required this.sub})
      : super(key: key);

  final Widget thumbnail;
  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 216, 215, 215)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: thumbnail,
              ),
            ),
            Expanded(
              flex: 3,
              child: _VideoDescription(
                title: title,
                sub: sub,
              ),
            ),
            const Icon(
              Icons.more_vert,
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({Key? key, required this.title, required this.sub})
      : super(key: key);

  final String title;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            sub,
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
