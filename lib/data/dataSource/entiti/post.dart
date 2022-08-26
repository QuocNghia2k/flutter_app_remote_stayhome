import 'package:equatable/equatable.dart';

class Post extends Equatable {
  String? id;
  String? idUser;
  String? detail;
  DateTime? createDate;

  Post({this.id, this.idUser, this.detail, this.createDate});

  factory Post.fromJson(String id, Map<String, dynamic> json) {
    return Post(
        id: id,
        idUser: json["idUser"],
        detail: json["detail"],
        createDate: json["createDate"]);
  }

  Map<String, dynamic> toMap() => {
        // "id": id,
        "idUser": idUser,
        "detail": detail,
        "createDate": createDate
      };

  @override
  // TODO: implement props
  List<Object?> get props => [idUser, detail, createDate];
}
