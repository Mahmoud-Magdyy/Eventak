import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/setting/data/models/delete_model.dart';

class LogOutReposatiry {
  Future<Either<String, String>> logOut() async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.logOut);
      return Right(response["message"]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  //! Delete Event
  Future<Either<String, DeleteAccountModel>> deleteAccount() async {
    try {
      final response =
          await sl<ApiConsumer>().delete(EndPoint.deleteAccount);
      return Right(DeleteAccountModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}