import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/create_event/data/models/create_event_model.dart';
import 'package:image_picker/image_picker.dart';

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
    required String nameOfLocation,
    required String street,
    required String district,
    // required String orgShortDesc,
    required XFile posterPicture,
  }) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoint.createEvent, isFormData: true, data: {
        Apikeys.nameOfEvent: nameOfEvent,
        Apikeys.posterPicture: await uploadImageToAPI(posterPicture),
        Apikeys.location: {
          Apikeys.nameOfLocation: nameOfLocation,
          Apikeys.street: street,
          Apikeys.district: district
        },
        Apikeys.description: description,
        Apikeys.startTime: startTime,
        Apikeys.endTime: endTime,
        Apikeys.date: date,
        Apikeys.category: category,
        Apikeys.priceInAdvance: priceInAdvance,
        Apikeys.priceAtTheDoor: priceAtTheDoor,
        Apikeys.whatIsIncludedInPrice: whatIsIncludedInPrice,
        // Apikeys.orgShortDesc: orgShortDesc
      });
      return Right(CreateEventModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, CreateEventModel>> sendPhotosOfEvent({
    required List<XFile> photosOfPlace,
  }) async {
    try {
      final response = await sl<ApiConsumer>()
          .post(EndPoint.sendPhotosOfEvent, isFormData: true, data: {
        Apikeys.photosOfPlace: await uploadImagesToAPI(photosOfPlace),
      });
      return Right(CreateEventModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  //! edit event 
  
}
