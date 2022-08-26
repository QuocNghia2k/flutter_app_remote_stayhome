import 'package:flutter_app_remote_stayhome/data/dataSource/service/house_service.dart';

import '../dataSource/entiti/house.dart';

abstract class HouseRepository {
  Future<List<House>> getAllHouse();
  Future addHouse(House house);
  Future updateHouse(House house);
}

class HouseRepositoryImpl implements HouseRepository {
  late HouseService houseService;

  HouseRepositoryImpl() {
    houseService = HouseService();
  }
  @override
  Future<List<House>> getAllHouse() async {
    return houseService.getAllHouse();
  }

  @override
  Future addHouse(House house) async {
    return houseService.addHouse(house);
  }

  @override
  Future updateHouse(House house) async {
    return houseService.updateHouse(house);
  }
}
