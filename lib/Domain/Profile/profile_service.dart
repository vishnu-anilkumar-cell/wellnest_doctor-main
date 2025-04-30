import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Profile/model.dart';
import 'package:wellnest_doctor/Domain/Profile/profile_model.dart';

abstract class ProfileService {
  Future<Either<MainFailure, Model>> getProfile();
  Future<Either<MainFailure, Unit>> updateProfile(
      {required ProfileModel profileModel});
}
