class DivileHouse {
  String? id;
  String? idHouse;
  String? nameDivile;
  bool? isOn;

  DivileHouse({this.id, this.idHouse, this.nameDivile, this.isOn});

  factory DivileHouse.fromJson(String id, Map<String, dynamic> map) {
    return DivileHouse(
        id: id,
        idHouse: map["idHouse"],
        nameDivile: map["nameDevile"],
        isOn: map["isOn"]);
  }
  Map<String, dynamic> toMap() => {
        // "id": id,
        "idHouse": idHouse,
        "nameDevile": nameDivile,
        "isOn": isOn,
      };
}
