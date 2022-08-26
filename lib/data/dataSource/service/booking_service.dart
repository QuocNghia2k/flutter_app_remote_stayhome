import 'package:cloud_firestore/cloud_firestore.dart';

import '../entiti/booking.dart';

class BookingService {
  late List<Booking> listBokking = [];
  late FirebaseFirestore db;

  BookingService() {
    db = FirebaseFirestore.instance;
    _init();
  }

  _init() {
    getAllBooking();
  }

  Future<List<Booking>> getAllBooking() async {
    await db.collection("bookings").get().then((event) {
      for (var booking in event.docs) {
        listBokking.add(Booking.fromJson(booking.id, booking.data()));
        print("${booking.id} => ${booking.data()}");
      }
    });
    return await listBokking;
  }

  Future addBooking(Booking booking) async {
    String id = "";
    db
        .collection("bookings")
        .add(booking.toMap())
        .then((DocumentReference doc) => id = doc.id);

    return id;
  }

  Future updateBooking(Booking booking) async {
    try {
      await db
          .collection("bookings")
          .doc(booking.idBooking)
          .update(booking.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
