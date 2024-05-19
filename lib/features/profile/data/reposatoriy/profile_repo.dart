import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/profile/data/models/get_profile_model.dart';

class ProfileReposatiry {
  Future<Either<String, ProfileModel>> getProfile() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getProfile);
      return Right(ProfileModel.fromJson(response["data"]));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}