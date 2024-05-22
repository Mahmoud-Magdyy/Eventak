class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String status;
  final bool isConfirmed;
  final String createdAt;
  final String updatedAt;
  final String nameOfEvent;
  final dynamic createdEvent;
  final Map<String, dynamic> profilePic;

  UserModel({
    required this.id,
    required this.nameOfEvent,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
    required this.isConfirmed,
    required this.createdAt,
    required this.updatedAt,
    required this.createdEvent,
    required this.profilePic,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      nameOfEvent: json['nameOfEvent'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      status: json['status'],
      isConfirmed: json['isConfirmed'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      createdEvent: json['createdEvent'],
      profilePic: Map<String, dynamic>.from(json['profilePic']),
    );
  }
}

class GetUsersResponse {
  final int numberOfUsers;
  final List<UserModel> data;

  GetUsersResponse({
    required this.numberOfUsers,
    required this.data,
  });

  factory GetUsersResponse.fromJson(Map<String, dynamic> jsonData) {
    return GetUsersResponse(
      numberOfUsers: jsonData['numberOfUsers'],
      data: (jsonData['data'] as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList(),
    );
  }
}
