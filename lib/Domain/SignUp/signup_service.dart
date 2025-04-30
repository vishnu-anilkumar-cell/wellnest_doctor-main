import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';

abstract class SignUpService {
  Future<Either<MainFailure, Unit>> signUp({required String email, required String password});
}
