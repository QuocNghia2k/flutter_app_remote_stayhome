import 'package:cloud_firestore/cloud_firestore.dart';
import '../entiti/house.dart';

class HouseService {
  List<House> listhouse = [];
  late FirebaseFirestore db;
  HouseService() {
    db = FirebaseFirestore.instance;
    _init();
  }

  _init() async {
    await getAllHouse();
  }

  Future<List<House>> getAllHouse() async {
    List<House> list = [];
    await db.collection("houses").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
        list.add(House.fromJson(doc.id, doc.data()));
      }
    });
    listhouse.clear();
    listhouse.addAll(list);
    return listhouse;
  }
  Future addHouse(House house) async {
    String id = "";
    db
        .collection("houses")
        .add(house.toMap())
        .then((DocumentReference doc) => id = doc.id);

    return id;
  }

  Future updateHouse(House house) async {
    try {
      await db
          .collection("houses")
          .doc(house.id)
          .update(house.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
