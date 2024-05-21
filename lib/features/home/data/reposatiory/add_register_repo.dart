import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/home/data/model/add_register_model.dart';

class AddRegisterReposatiry {
  Future<Either<String, GetRegisterData>> addRegister(String nameofEvent) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.addRegisterEndPoints(nameofEvent));
      return Right(GetRegisterData.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}