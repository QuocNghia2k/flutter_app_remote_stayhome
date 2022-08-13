import 'package:equatable/equatable.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/comment.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/image.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';

class Post extends Equatable {
  String? idUser;
  String? detail;
  // final int like;
  DateTime? createDate;

  Post(
      {this.idUser,
      this.detail,
      // required this.like,
      this.createDate});

  @override
  // TODO: implement props
  List<Object?> get props => [idUser, detail, createDate];
}
