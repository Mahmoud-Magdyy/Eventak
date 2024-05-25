import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/my_events/data/models/edit_model.dart';

class EditEventRepo {
  Future<Either<String, EditEventModel>> editEvent({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.editEventEndPoints(id),
        data: data,
        // isFormData: true
      );
      return Right(EditEventModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
