
class SendCodeModel {
  final String status;
  final String message;

  SendCodeModel({
    required this.status,
    required this.message,
  });
  factory SendCodeModel.fromJson(Map jsonData) {
    return SendCodeModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }
}
