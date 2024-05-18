
import 'package:eventak/core/database/api/api/end_points.dart';
class TrendingEeventModel {
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
  final String publishAt;
  final String broughtToYouBy;
  final Map<String, dynamic> location;
  final Map<String, dynamic> posterPicture;
  final Map<String, dynamic> creatorPicture;
  TrendingEeventModel(
      {
      required this.id,
      required this.nameOfEvent,
      required this.creatorPicture,
      required this.posterPicture,
      required this.broughtToYouBy,
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

  factory TrendingEeventModel.fromJson(Map<String, dynamic> json) {
    return TrendingEeventModel(
      broughtToYouBy: json['broughtToYouBy'],
      publishAt: json['publishAt'],
      location: Map<String, dynamic>.from(
        json['location']
        ),
      posterPicture: Map<String, dynamic>.from(
        json['posterPicture']
        ),
      creatorPicture: Map<String, dynamic>.from(
        json['creatorPicture']
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

class GetTrendingEvents {
  final String status;
  final int numberOfEvents;
  final List<TrendingEeventModel> data;
  factory GetTrendingEvents.fromJson(Map<String, dynamic> jsonData) {
    return GetTrendingEvents(
        status: jsonData[Apikeys.status],
        numberOfEvents: jsonData[Apikeys.numberOfEvents],
        data: jsonData[Apikeys.data]
            .map<TrendingEeventModel>((i) => TrendingEeventModel.fromJson(i))
            .toList());
  }
  GetTrendingEvents(
      {required this.status, required this.numberOfEvents, required this.data});
}
