
class RegisterModel {
  final String status;
  final String message;

  RegisterModel({
    required this.status,
    required this.message,
  });
  factory RegisterModel.fromJson(Map jsonData) {
    return RegisterModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }
}
