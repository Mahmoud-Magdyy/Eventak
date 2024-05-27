import 'package:eventak/core/database/api/api/end_points.dart';

class MyCreatedEventModel {
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
  // final String orgShortDesc;
  final String publishAt;
  final Map<String, dynamic> location;
  final Map<String, dynamic> posterPicture;
  final Map<String, dynamic> creatorPicture;
  MyCreatedEventModel( 
      {
      required this.id,
      required this.creatorPicture,
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
      // required this.orgShortDesc
      });

  factory MyCreatedEventModel.fromJson(Map<String, dynamic> json) {
    return MyCreatedEventModel(
      
      broughtToYouBy: json['broughtToYouBy'],
      publishAt: json['publishAt'],
      location: Map<String, dynamic>.from(
        json['location']
        ),
      creatorPicture: Map<String, dynamic>.from(
        json['creatorPicture']
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
      // orgShortDesc: json['orgShortDesc'],
    );
  }
}

class GetMyCreatedEvents {
  final String status;
  final int numberOfEvents;
  final List<MyCreatedEventModel> data;
  factory GetMyCreatedEvents.fromJson(Map<String, dynamic> jsonData) {
    return GetMyCreatedEvents(
        status: jsonData[Apikeys.status],
        numberOfEvents: jsonData[Apikeys.numberOfEvents],
        data: jsonData[Apikeys.data]
            .map<MyCreatedEventModel>((i) => MyCreatedEventModel.fromJson(i))
            .toList());
  }
  GetMyCreatedEvents( 
      {required this.status, required this.numberOfEvents, required this.data});
}
