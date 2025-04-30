
import 'package:dartz/dartz.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Message/ViewMessage/view_message_model.dart';

abstract class ViewMessageService {
  Future<Either<MainFailure, ViewMessageModel>> getViewMessages(int id);
}
