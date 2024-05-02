import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/create_event/data/models/create_event_model.dart';

class CreateEventReposatiry {
  Future<Either<String, CreateEventModel>> createEvent({
    required String nameOfEvent,
    required String description,
    required String startTime,
    required String endTime,
    required String date,
    required String category,
    required String priceInAdvance,
    required String priceAtTheDoor,
    required String whatIsIncludedInPrice,
    required String orgShortDesc,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.createEvent, data: {
        Apikeys.nameOfEvent: nameOfEvent,
        Apikeys.description: description,
        Apikeys.startTime: startTime,
        Apikeys.endTime: endTime,
        Apikeys.date: date,
        Apikeys.category: category,
        Apikeys.priceInAdvance: priceInAdvance,
        Apikeys.priceAtTheDoor: priceAtTheDoor,
        Apikeys.whatIsIncludedInPrice: whatIsIncludedInPrice,
        Apikeys.orgShortDesc: orgShortDesc,
        "location": {
          "nameOfLocation": "egypt",
          "street": "al andalus",
          "district": "8"
        },
      });
      return Right(CreateEventModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
