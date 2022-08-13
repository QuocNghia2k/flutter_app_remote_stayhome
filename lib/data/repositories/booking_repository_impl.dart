import '../dataSource/entiti/booking.dart';
import '../dataSource/service/booking_service.dart';
abstract class BookingRepository {
  Future<List<Booking>> getAllBooking();
// Future<Booking> getBooking(int id);
}

class BookingRepositoryImpl implements BookingRepository {
  BookingService bookingService = BookingService();

  @override
  Future<List<Booking>> getAllBooking() async{
    return  bookingService.getAllBooking();
  }
}
