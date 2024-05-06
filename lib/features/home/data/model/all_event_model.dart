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
  final String orgShortDesc;
  final Map<String,dynamic> location;

  AllEventModel( 
      {required this.id,
      required this.nameOfEvent,
      required this.location,
      required this.description,
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
      location:Map<String,dynamic>.from(json['location']) ,
      id: json['_id'],
      nameOfEvent: json['_id'],
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
  final int numberOfEvents;
  final List<AllEventModel> data;
  factory GetAllEvents.fromJson(Map<String, dynamic> jsonData) {
    return GetAllEvents(
        status: jsonData[Apikeys.status],
        numberOfEvents: jsonData[Apikeys.numberOfEvents],
        data: jsonData[Apikeys.data]
            .map<AllEventModel>((i) => AllEventModel.fromJson(i))
            .toList());
  }
  GetAllEvents(
      {required this.status, required this.numberOfEvents, required this.data});
}
