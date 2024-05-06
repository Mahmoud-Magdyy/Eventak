import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';

class GetAllEventsReposatiry {
  Future<Either<String, GetAllEvents>> getAllEvents() async {
    try {
      final response = await sl<ApiConsumer>().get(
        EndPoint.getAllEvents,
      );
      return Right(GetAllEvents.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
