import 'package:flutter/cupertino.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/booking.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/booking_repository_impl.dart';
import 'package:flutter_app_remote_stayhome/data/repositories/divile_repository.dart';

import '../data/dataSource/entiti/house.dart';
import '../data/repositories/house_repository.dart';

class HomeProvider extends ChangeNotifier {
  List<House> _listHouse = [];
  List<Booking> _listBooking = [];
  List<DivileHouse> _listDivile = [];
  List<DivileHouse> listDivileInId = [];
  List<Booking> listBokkingInId = [];
  HouseRepository houseRepository = HouseRepositoryImpl();
  BookingRepository bookingRepository = BookingRepositoryImpl();
  DivileReository divileReository = DivileReositoryImpl();

  List<Booking> get listBooking {
    return _listBooking;
  }

  List<DivileHouse> get listDivile {
    return _listDivile;
  }

  List<House> get listHouse {
    return _listHouse;
  }

  HomeProvider() {
    _init();
    // notifyListeners();
  }

  _init() async {
    _listHouse = await houseRepository.getAllHouse();
    _listBooking = await bookingRepository.getAllBooking();
    _listDivile = await divileReository.getAllDivile();
    notifyListeners();
  }

  Future addHouse(House house) async {
    houseRepository.addHouse(house);
    _init();
    notifyListeners();
  }

  Future addBooking(Booking booking) async {
    bookingRepository.addBooking(booking);
    _init();
    notifyListeners();
  }

  Future addDivile(DivileHouse divile) async {
    divileReository.addDivile(divile);
    _init();
    notifyListeners();
  }

  Future updateHouse(House house) async {
    houseRepository.updateHouse(house);
    _init();
    notifyListeners();
  }

  Future updateBooking(Booking booking) async {
    bookingRepository.updateBooking(booking);
    _init();
    notifyListeners();
  }

  Future updateDivile(DivileHouse divile) async {
    divileReository.updateDivile(divile);
    _init();
    notifyListeners();
  }

  List<Booking> findBookingInId(String id) {
    List<Booking> list = [];
    for (var booking in _listBooking) {
      if (booking.idUser == id) {
        print(booking.toString());
        list.add(booking);
      }
    }
    listBokkingInId.clear();
    listBokkingInId.addAll(list);
    // notifyListeners();
    return list;
  }

  Future<List<DivileHouse>> findDivileInId(String id) async {
    List<DivileHouse> list=[];
    for (var divile in _listDivile) {
      if (divile.idHouse == id) {
        listDivileInId.add(divile);
        list.add(divile);
      }
    }
    notifyListeners();
    return list;
  }
}
