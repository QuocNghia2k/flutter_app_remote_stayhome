import 'package:equatable/equatable.dart';
import 'package:flutter_app_remote_stayhome/data/dataSource/entiti/user.dart';

class Comment extends Equatable {
  final User orner;
  final String detailComment;
  final DateTime createDate;

  Comment(
      {required this.orner,
      required this.detailComment,
      required this.createDate});

  @override
  // TODO: implement props
  List<Object?> get props => [orner, detailComment, createDate];
}
