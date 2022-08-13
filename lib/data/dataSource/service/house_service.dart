import '../entiti/booking.dart';
import '../entiti/house.dart';
import '../entiti/image.dart';

class HouseService {
  late List<House> listhouse;

  HouseService() {
    _init();
  }

  _init() async {
    listhouse = await getAllHouse();
  }

  Future<List<House>> getAllHouse() async {
    List<Booking> list1 = [
      Booking(
          idHouse: "1",
          idUser: "1",
          startDate: DateTime.now(),
          endDate: DateTime.now()),
      Booking(
          idHouse: "1",
          idUser: "2",
          startDate: DateTime.now(),
          endDate: DateTime.now())
    ];
    List<Booking> list2 = [
      Booking(
          idHouse: "2",
          idUser: "1",
          startDate: DateTime.now(),
          endDate: DateTime.now()),
      Booking(
          idHouse: "2",
          idUser: "2",
          startDate: DateTime.now(),
          endDate: DateTime.now())
    ];
    List<House> resurt = [
      House(
          id: 1,
          name: 'The Moon House',
          address: 'P455, Chhatak, Sylhet',
          idImage: 'assets/images/house01.jpeg',
          listBooking: list1),
      House(
          id: 2,
          name: 'The Moon House',
          address: 'P455, Chhatak, Sylhet',
          idImage: 'assets/images/house02.jpeg',
          listBooking: list2),
    ];
    return resurt;
  }

  Future<List<House>> getBestOffer() async {
    List<Booking> list1 = [
      Booking(
          idHouse: "1",
          idUser: "1",
          startDate: DateTime.now(),
          endDate: DateTime.now()),
      Booking(
          idHouse: "1",
          idUser: "2",
          startDate: DateTime.now(),
          endDate: DateTime.now())
    ];
    List<Booking> list2 = [
      Booking(
          idHouse: "2",
          idUser: "1",
          startDate: DateTime.now(),
          endDate: DateTime.now()),
      Booking(
          idHouse: "2",
          idUser: "2",
          startDate: DateTime.now(),
          endDate: DateTime.now())
    ];
    return [
      House(
          id: 1,
          name: 'The Moon House',
          address: 'P455, Chhatak, Sylhet',
          idImage: 'assets/images/offer01.jpeg',
          listBooking: list1),
      House(
          id: 2,
          name: 'The Moon House',
          address: 'P455, Chhatak, Sylhet',
          idImage: 'assets/images/offer02.jpeg',
          listBooking: list2),
    ];
  }
}
