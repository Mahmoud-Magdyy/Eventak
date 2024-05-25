

class EditProfileModel {
  final String status;
  final String message;

  EditProfileModel({
    required this.status,
    required this.message,
  });
  factory EditProfileModel.fromJson(Map<String, dynamic> jsonData) {
    return EditProfileModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }
}
