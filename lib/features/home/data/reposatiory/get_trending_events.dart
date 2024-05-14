import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/home/data/model/trend_event_model.dart';

class GetTrendigEventsReposatiry {
  Future<Either<String, GetTrendingEvents>> getTrendigEvents() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getTrendigEvents);
      return Right(GetTrendingEvents.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
