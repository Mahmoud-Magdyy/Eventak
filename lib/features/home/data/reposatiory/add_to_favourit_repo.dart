import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/home/data/model/add_fav_model.dart';
import 'package:eventak/features/home/data/model/remove_fav_model.dart';

class AddToFavouritReposatiry {
  Future<Either<String, AddFavModel>> addToFavourit(String id) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.addToFavouriteEndPoints(id));
      return Right(AddFavModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  Future<Either<String, RemoveFavModel>> removeFromFavourit(String id) async {
    try {
      final response =
          await sl<ApiConsumer>().post(EndPoint.removeFromFavouriteEndPoints(id));
      return Right(RemoveFavModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
