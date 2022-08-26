import '../dataSource/entiti/divile.dart';
import '../dataSource/service/divile_service.dart';

abstract class DivileReository {
  Future<List<DivileHouse>> getAllDivile();
  Future addDivile(DivileHouse booking);
  Future updateDivile(DivileHouse booking);
}

class DivileReositoryImpl implements DivileReository {
  DevileService divileService = DevileService();
  @override
  Future addDivile(DivileHouse divile) {
    return divileService.addDivile(divile);
  }

  @override
  Future<List<DivileHouse>> getAllDivile() {
    return divileService.getAllDivile();
  }

  @override
  Future updateDivile(DivileHouse divile) {
    return divileService.updateDivile(divile);
  }
}
