import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/my_events/data/models/ai_model.dart';
import 'package:image_picker/image_picker.dart';

class ModelUserReposatiry {
  Future<Either<String, AiModel>> model({
    required XFile img1,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.model,
       data: {
        'img1': await uploadImageToAPI(img1),
      },
      isFormData: true
      );
      return Right(AiModel.fromJson(response) );
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}