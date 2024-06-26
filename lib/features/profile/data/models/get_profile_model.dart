
class ProfileModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final dynamic createdEvent;
  final Map<String, dynamic> profilePic;

  ProfileModel( 
      {
      required this.id,
      required this.firstName,
      required this.lastName,
      required this.createdEvent,
      required this.profilePic,
      required this.email,
      });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      createdEvent: json['createdEvent'],
      profilePic: Map<String, dynamic>.from(
        json['profilePic']
        ),
      id: json['_id'],
      
    );
  }
}

// class GetProfiles {
//   final String status;
//   final List<ProfileModel> data;
//   factory GetProfiles.fromJson(Map<String, dynamic> jsonData) {
//     return GetProfiles(
//         status: jsonData[Apikeys.status],
//         data: jsonData[Apikeys.data]
//             .map<ProfileModel>((i) => ProfileModel.fromJson(i))
//             .toList());
//   }
//   GetProfiles( 
//       {required this.status,required this.data});
// }
