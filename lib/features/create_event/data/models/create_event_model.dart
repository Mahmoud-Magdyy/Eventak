
class CreateEventModel {
  final String status;
  final String message;

  CreateEventModel({
    required this.status,
    required this.message,
  });
  factory CreateEventModel.fromJson(Map jsonData) {
    return CreateEventModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }
}
