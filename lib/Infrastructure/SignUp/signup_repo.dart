import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest_doctor/Constant/constants.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/SignUp/signup_service.dart';

@LazySingleton(as: SignUpService)
class SignUpRepo implements SignUpService {
  @override
  Future<Either<MainFailure, Unit>> signUp({required String email, required String password}) async {
    try {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers)).post(
        "${baseUrl}api/DoctorReg",
        data: {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        return const Right(unit);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      if (e is DioException && e.response?.statusCode == 500) {
        return const Left(MainFailure.serverFailure());
      } else if (e is SocketException) {
        return const Left(MainFailure.clientFailure());
      } else if (e is DioException && e.response?.statusCode == 409) {
        return const Left(MainFailure.authFailure());
      } else {
        return const Left(MainFailure.otherFailure());
      }
    }
  }
}
