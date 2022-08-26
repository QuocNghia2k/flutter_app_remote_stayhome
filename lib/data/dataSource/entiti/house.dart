import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/booking.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/divile.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/image.dart';

class House {
  String? id;
  String? name;
  String? address;
  String? idImage;
  List<dynamic>? listBooking;
  List<dynamic>? listDivile;
  House({this.id, this.name, this.address, this.idImage, this.listBooking, this.listDivile});


  factory House.fromJson(String id, Map<String, dynamic> json){
    return House(
      id:  id,
      name: json["name"],
      address: json["address"],
      idImage: json["idImage"],
      listBooking: json["listBooking"],
      listDivile: json["listDivile"]
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "address":address,
      "idImage":idImage,
      "listBooking":listBooking,
      "listDivile": listDivile
    };
  }
}
