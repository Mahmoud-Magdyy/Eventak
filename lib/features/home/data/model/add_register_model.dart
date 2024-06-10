import 'package:eventak/core/database/api/api/end_points.dart';

class UserProfilePic {
  final String secureUrl;
  final String publicId;

  UserProfilePic({required this.secureUrl, required this.publicId});

  factory UserProfilePic.fromJson(Map<String, dynamic> json) {
    return UserProfilePic(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
    );
  }
}

class User {
  final UserProfilePic? profilePic;
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String status;
  final bool isConfirmed;
  final bool codeCompare;
  final List<List<String>> favEvent;
  final String createdAt;
  final String updatedAt;
  final int? v;
  final int? createdEvent;

  User({
    required this.profilePic,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
    required this.isConfirmed,
    required this.codeCompare,
    required this.favEvent,
    required this.createdAt,
    required this.updatedAt,
    this.v,
    this.createdEvent,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      profilePic: json['profilePic'] != null ? UserProfilePic.fromJson(json['profilePic']) : null,
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      status: json['status'],
      isConfirmed: json['isConfirmed'],
      codeCompare: json['codeCompare'],
      favEvent: List<List<String>>.from(
          json['favEvent'].map((eventList) => List<String>.from(eventList))),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'] ?? 0,
      createdEvent: json['createdEvent'] ?? 0,
    );
  }
}

class AddRegisterModel {
  final String idEvent;
  final String nameOfEvent;
  final String createrEmail;
  final int v;
  final User user;

  AddRegisterModel({
    required this.v,
    required this.nameOfEvent,
    required this.createrEmail,
    required this.idEvent,
    required this.user,
  });

  factory AddRegisterModel.fromJson(Map<String, dynamic> json) {
    return AddRegisterModel(
      v: json['__v'] ?? 0,
      createrEmail: json['createrEmail'],
      nameOfEvent: json['nameOfEvent'],
      idEvent: json['_id'],
      user: User.fromJson(json['user']),
    );
  }
}

class GetRegisterData {
  final String message;
  final AddRegisterModel data;

  GetRegisterData({
    required this.message,
    required this.data,
  });

  factory GetRegisterData.fromJson(Map<String, dynamic> jsonData) {
    return GetRegisterData(
      message: jsonData[Apikeys.message],
      data: AddRegisterModel.fromJson(jsonData[Apikeys.data]),
    );
  }
}
