import 'package:eventak/core/database/api/api/end_points.dart';

class AddRegisterModel {
  final String id;
  final String nameOfEvent;
  final String emailOfUser;
  final String createrEmail;
  final dynamic v;
  
  AddRegisterModel( 
      {
      required this.v,
      required this.emailOfUser,
      required this.nameOfEvent,
      required this.createrEmail,
      required this.id,
      });

  factory AddRegisterModel.fromJson(Map<String, dynamic> json) {
    return AddRegisterModel(
      v: json['__v'],
      createrEmail: json['createrEmail'],
      emailOfUser: json['emailOfUser'],
      
      nameOfEvent: json['nameOfEvent'],
      id: json['_id'],
    );
  }
}

class GetRegisterData {
  final String message;
  final List<AddRegisterModel> data;
  factory GetRegisterData.fromJson(Map<String, dynamic> jsonData) {
    return GetRegisterData(
        message: jsonData[Apikeys.message],
        data: (jsonData[Apikeys.data ])
            .map<AddRegisterModel>((i) => AddRegisterModel.fromJson(i))
            .toList());
  }
  GetRegisterData( 
      {required this.message,required this.data});
}
