import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Home/StartChat/start_chat_model.dart';

abstract class StartChatServicce {
  Future<Either<MainFailure, StartChatModel>> startChat(String bookid);
}