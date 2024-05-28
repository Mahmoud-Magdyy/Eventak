import 'package:eventak/core/database/api/api/end_points.dart';

class RequestedInMyEventsModel {
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
  RequestedInMyEventsModel( 
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

  factory RequestedInMyEventsModel.fromJson(Map<String, dynamic> json) {
    return RequestedInMyEventsModel(
      
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

class GetRequestedInMyEventss {
  final int numberOfEvents;
  final List<RequestedInMyEventsModel> events;
  factory GetRequestedInMyEventss.fromJson(Map<String, dynamic> jsonData) {
    return GetRequestedInMyEventss(
        numberOfEvents: jsonData[Apikeys.numberOfEvents],
        events: jsonData['events']
            .map<RequestedInMyEventsModel>((i) => RequestedInMyEventsModel.fromJson(i))
            .toList());
  }
  GetRequestedInMyEventss( 
      { required this.numberOfEvents, required this.events});
}
