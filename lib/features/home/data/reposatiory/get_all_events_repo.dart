import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';

class GetAllEventsReposatiry {
  Future<Either<String, GetAllEvents>> getAllEvents(
      {String? categoryName}) async {
    try {
      
      final endpoint = categoryName == null || categoryName==''
          ? 'event/getAllEvents'
          :'event/getAllEvents?category=$categoryName' ;
      final response = await sl<ApiConsumer>().get(endpoint);
      return Right(GetAllEvents.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
