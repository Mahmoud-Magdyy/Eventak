import 'package:eventak/core/database/api/api/end_points.dart';

class AllEventModel {
  final String id;
  final String nameOfEvent;
  final String description;
  final String date;
  final String startTime;
  final String endTime;
  final String category;
  final String priceInAdvance;
  final String priceAtTheDoor;
  final String whatIsIncludedInPrice;
  final String broughtToYouBy;
  final String orgShortDesc;
  final String publishAt;
  final Map<String, dynamic> location;
  final Map<String, dynamic> posterPicture;
   bool isFavourite;
   bool isCreator;
  AllEventModel( 
      {
      required this.id,
      required this.isFavourite,
      required this.isCreator,
      required this.nameOfEvent,
      required this.broughtToYouBy,
      required this.posterPicture,
      required this.location,
      required this.description,
      required this.publishAt,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.category,
      required this.priceInAdvance,
      required this.priceAtTheDoor,
      required this.whatIsIncludedInPrice,
      required this.orgShortDesc});

  factory AllEventModel.fromJson(Map<String, dynamic> json) {
    return AllEventModel(
      broughtToYouBy: json['broughtToYouBy'],
      isCreator: json['isCreator'],
      isFavourite: json['IsFavourite'],
      publishAt: json['publishAt'],
      location: Map<String, dynamic>.from(
        json['location']
        ),
      posterPicture: Map<String, dynamic>.from(
        json['posterPicture']
        ),
      id: json['_id'],
      nameOfEvent: json['nameOfEvent'],
      description: json['description'],
      date: json['date'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      category: json['category'],
      priceInAdvance: json['priceInAdvance'],
      priceAtTheDoor: json['priceAtTheDoor'],
      whatIsIncludedInPrice: json['whatIsIncludedInPrice'],
      orgShortDesc: json['orgShortDesc'],
    );
  }
}

class GetAllEvents {
  final String status;
  final Map<String,dynamic> craetorPic;
  final int numberOfEvents;
  final List<AllEventModel> data;
  factory GetAllEvents.fromJson(Map<String, dynamic> jsonData) {
    return GetAllEvents(
        craetorPic: jsonData[Apikeys.craetorPic],
        status: jsonData[Apikeys.status],
        numberOfEvents: jsonData[Apikeys.numberOfEvents],
        data: jsonData[Apikeys.data]
            .map<AllEventModel>((i) => AllEventModel.fromJson(i))
            .toList());
  }
  GetAllEvents( 
      {required this.status,required this.craetorPic, required this.numberOfEvents, required this.data});
}
