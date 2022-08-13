import 'package:cloud_firestore/cloud_firestore.dart';

import '../entiti/booking.dart';

class BookingService {
  late List<Booking> listBokking;
  late FirebaseFirestore db;

  BookingService() {
    db = FirebaseFirestore.instance;
    _init();
  }

  _init() {}

  Future<List<Booking>> getAllBooking() async {
    await db.collection("boookings").get().then((event) {
      for (var booking in event.docs) {
        listBokking.add(Booking.fromJson(booking.id, booking.data()));

        print("${booking.id} => ${booking.data()}");
      }
    });

    return await listBokking;
  }
}
