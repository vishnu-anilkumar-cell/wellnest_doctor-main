import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Home/ViewAppointments/view_bookings_model.dart';

abstract class ViewBookingsService{
  Future<Either<MainFailure,List<Bookings>>> viewBookings();
}