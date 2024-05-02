
class PassVerificationModel {
  final String status;
  final String message;

  PassVerificationModel({
    required this.status,
    required this.message,
  });
  factory PassVerificationModel.fromJson(Map jsonData) {
    return PassVerificationModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }
}
