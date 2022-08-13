import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/booking.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/image.dart';

class House {
  int? id;
  String? name;
  String? address;
  String? idImage;
  List<Booking>? listBooking;
  List<Divile>? listDivile;
  House({this.id, this.name, this.address, this.idImage, this.listBooking});

  static List<House> generateRecommended() {
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
          idImage: 'assets/images/house01.jpeg',
          listBooking: list1),
      House(
          id: 2,
          name: 'The Moon House',
          address: 'P455, Chhatak, Sylhet',
          idImage: 'assets/images/house02.jpeg',
          listBooking: list2),
    ];
  }

  static List<House> generateBestOffer() {
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
          idHouse: '2',
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
