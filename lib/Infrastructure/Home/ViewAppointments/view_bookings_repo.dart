import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnest_doctor/Constant/constants.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Home/ViewAppointments/view_bookings_model.dart';
import 'package:wellnest_doctor/Domain/Home/ViewAppointments/view_bookings_service.dart';

@LazySingleton(as: ViewBookingsService)
class ViewBookingsRepo implements ViewBookingsService{
  @override
  Future<Either<MainFailure, List<Bookings>>> viewBookings() async{
       try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .get("${baseUrl}api/ViewMyAppoinments", data: {
        "email": email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final viewBookingsModel = ViewBookingsModel.fromJson(response.data);
        return Right(viewBookingsModel.bookings!);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 404) {
        return const Left(MainFailure.authFailure());
      } else if (e is DioException && e.response?.statusCode == 400) {
        return const Left(MainFailure.incorrectCredential());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    } 
  }
}