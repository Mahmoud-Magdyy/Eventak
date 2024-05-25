import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/profile/data/models/edit_profile_model.dart';

class EditProfileRepo {
  Future<Either<String, EditProfileModel>> editProfile({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.editProfile,
        data: data,
        // isFormData: true
      );
      return Right(EditProfileModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
