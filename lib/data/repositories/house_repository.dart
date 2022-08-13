import 'package:flutter_app_remote_stayhome/data/dataSource/service/house_service.dart';

import '../dataSource/entiti/house.dart';

abstract class HouseRepository {
  Future<List<House>> getAllHouse();
// Future<House> getHouse(int id);
}

class HouseRepositoryImpl implements HouseRepository {
  HouseService houseService = HouseService();

  @override
  Future<List<House>> getAllHouse() async {
    return await houseService.getAllHouse();
  }
}
