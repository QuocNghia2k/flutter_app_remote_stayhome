import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';

class DevileService {
  List<DivileHouse> listDivile = [];
  late FirebaseFirestore db;

  DevileService() {
    db = FirebaseFirestore.instance;
    _init();
  }
  _init() async {
    await getAllDivile();
  }

  Future<List<DivileHouse>> getAllDivile() async {
    await db.collection("diviles").get().then((event) {
      for (var divile in event.docs) {
        listDivile.add(DivileHouse.fromJson(divile.id, divile.data()));
        print("${divile.id} => ${divile.data()}");
      }
    });
    return await listDivile;
  }

  Future addDivile(DivileHouse divile) async {
    String id = "";
    db
        .collection("diviles")
        .add(divile.toMap())
        .then((DocumentReference doc) => id = doc.id);

    return id;
  }

  Future updateDivile(DivileHouse divile) async {
    try {
      await db
          .collection("bookings")
          .doc(divile.id)
          .update(divile.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
