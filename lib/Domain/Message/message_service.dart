import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Message/message_model.dart';

abstract class MessageService {
  Future<Either<MainFailure,MessageModel>>  getMessages();
}
