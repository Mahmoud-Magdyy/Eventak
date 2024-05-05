
class SendCodeModel {
  final String status;
  final String message;
  final String id;

  SendCodeModel( {
    required this.id,
    required this.status,
    required this.message,
  });
  factory SendCodeModel.fromJson(Map jsonData) {
    return SendCodeModel(
      status: jsonData['status'],
      message: jsonData['message'],
      id: jsonData['id'],
    );
  }
}
