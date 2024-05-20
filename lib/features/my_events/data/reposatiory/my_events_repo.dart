import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/my_events/data/models/delete_model.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';

class GetMyCreatedEventsReposatiry {
  Future<Either<String, GetMyCreatedEvents>> getMyEvents() async {
    try {
      final response = await sl<ApiConsumer>().get(EndPoint.getMyCreatedEvents);
      return Right(GetMyCreatedEvents.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
//! Delete Event
  Future<Either<String, DeleteModel>> deleteEvent(String id) async {
    try {
      final response =
          await sl<ApiConsumer>().delete(EndPoint.deleteEventEndPoints(id));
      return Right(DeleteModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

}