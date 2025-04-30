import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/SignIn/sign_in_model.dart';



abstract class SignInService {
  Future<Either<MainFailure,SignInModel>> signInWithEmailAndPassword(String email, String password);
}