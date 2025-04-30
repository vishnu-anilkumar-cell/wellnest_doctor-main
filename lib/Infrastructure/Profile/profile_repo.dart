import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnest_doctor/Constant/constants.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Profile/model.dart';
import 'package:wellnest_doctor/Domain/Profile/profile_model.dart';
import 'package:wellnest_doctor/Domain/Profile/profile_service.dart';

@LazySingleton(as: ProfileService)
class ProfileRepo implements ProfileService {
  @override
  Future<Either<MainFailure, Model>> getProfile() async {
    log('getProfile');
     final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      log(email.toString());
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .get("${baseUrl}api/DoctorProfile", data: {
        'email': email,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final profileModel = Model.fromJson(response.data);
        return Right(profileModel);
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

  @override
  Future<Either<MainFailure, Unit>> updateProfile(
      {required ProfileModel profileModel}) async {
    try {
      final sha = await SharedPreferences.getInstance();
      final email = sha.getString('email');
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .put("${baseUrl}api/DoctorProfile", data: {
        'email': email,
        'name': profileModel.name,
        'patents':int.parse(profileModel.patients),
        'experence':int.parse( profileModel.experience),
        'specialization': profileModel.specialization,
        'education': profileModel.education,
        'about': profileModel.about,
      });
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
