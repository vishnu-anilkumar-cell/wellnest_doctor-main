
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest_doctor/Constant/constants.dart';
import 'package:wellnest_doctor/Domain/Failure/failure.dart';
import 'package:wellnest_doctor/Domain/Message/SendMessage/send_message_service.dart';

@LazySingleton(as: SendMessageService)
class SendMessageRepo implements SendMessageService {
  @override
  Future<Either<MainFailure, Unit>> sendMessage(int id, String message) async{
     try {
      final Map<String, dynamic> headers = {
        'Content-Type': 'application/json',
      };
      final Response response = await Dio(BaseOptions(headers: headers))
          .post("${baseUrl}api/SendClintMessage", data: {
            "roomid":id,
            "message":message
          });
      if (response.statusCode == 200 || response.statusCode == 201) {    
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
