import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  String? idBooking;
  String? idHouse;
  String? idUser;
  DateTime? startDate;
  DateTime? endDate;

  Booking(
      {this.idBooking,
      this.idHouse,
      this.idUser,
      this.startDate,
      this.endDate});

  factory Booking.fromJson(String id, Map<String, dynamic> json) {
    return Booking(
        idBooking: id,
        idHouse: json["idHouse"],
        idUser: json["idUser"],
        startDate: json["startDate"],
        endDate: json["endDate"]);
  }

  Map<String, dynamic> toMap() => {
        // "id": id,
        "idHouse": idHouse,
        "idUser": idUser,
        "startDate": startDate,
        "endDate": endDate
      };

  @override
  // TODO: implement props
  List<Object?> get props => [idHouse, idUser, startDate, endDate];
}
