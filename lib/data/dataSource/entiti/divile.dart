class Divile {
  String? id;
  String? idHouse;
  String? nameDivile;
  bool? isOn;

  Divile({this.id, this.idHouse, this.nameDivile, this.isOn});

  factory Divile.fromJson(String id, Map<String, dynamic> map) {
    return Divile(
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
