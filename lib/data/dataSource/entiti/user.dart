import 'package:equatable/equatable.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/image.dart';

class User extends Equatable {
  String? id;
  String? fullname;
  int? age;
  String? gmail;
  String? username;
  String? passwork;
  String? idProfilePictrure;
  String? role;
  User(
      {this.id,
      this.fullname,
      this.age,
      this.gmail,
      this.username,
      this.passwork,
      this.idProfilePictrure,
      this.role});

  factory User.fromJson(String id, Map<String, dynamic> json) {
    return User(
        id: id,
        fullname: json['fullname'],
        age: json['age'],
        gmail: json['gmail'],
        username: json['username'],
        passwork: json['passwork'],
        idProfilePictrure: json['profile_picture'],
        role: json['role']);
  }

  Map<String, dynamic> toMap() => {
        // "id": id,
        "fullname": fullname,
        "age": age,
        "username": username,
        "passwork": passwork,
        "idProfilePictrure": idProfilePictrure,
        "role": role
      };
  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, fullname, age, gmail, username, passwork, role];
}
