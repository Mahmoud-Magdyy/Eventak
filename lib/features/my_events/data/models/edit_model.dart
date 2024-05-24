class EditEventModel {
  final String status;
  final EventData data;

  EditEventModel({
    required this.status,
    required this.data,
  });

  factory EditEventModel.fromJson(Map<String, dynamic> jsonData) {
    return EditEventModel(
      status: jsonData['status'],
      data: EventData.fromJson(jsonData['data']),
    );
  }
}

class EventData {
  final Event event;

  EventData({required this.event});

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      event: Event.fromJson(json['event']),
    );
  }
}

class Event {
  final Location location;
  final Picture posterPicture;
  final Picture creatorPicture;
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
  final String userId;
  final int favorites;
  final List<dynamic> photosOfPlace;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final String broughtToYouBy;
  final String publishAt;

  Event({
    required this.location,
    required this.posterPicture,
    required this.creatorPicture,
    required this.id,
    required this.nameOfEvent,
    required this.description,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.category,
    required this.priceInAdvance,
    required this.priceAtTheDoor,
    required this.whatIsIncludedInPrice,
    required this.orgShortDesc,
    required this.userId,
    required this.favorites,
    required this.photosOfPlace,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.broughtToYouBy,
    required this.publishAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      location: Location.fromJson(json['location']),
      posterPicture: Picture.fromJson(json['posterPicture']),
      creatorPicture: Picture.fromJson(json['creatorPicture']),
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
      userId: json['userId'],
      favorites: json['favorites'],
      photosOfPlace: List<dynamic>.from(json['photosOfPlace']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      broughtToYouBy: json['broughtToYouBy'],
      publishAt: json['publishAt'],
    );
  }
}

class Location {
  final String nameOfLocation;
  final String street;
  final String district;

  Location({
    required this.nameOfLocation,
    required this.street,
    required this.district,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      nameOfLocation: json['nameOfLocation'],
      street: json['street'],
      district: json['district'],
    );
  }
}

class Picture {
  final String secureUrl;
  final String? publicId;

  Picture({
    required this.secureUrl,
    this.publicId,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
    );
  }
}
