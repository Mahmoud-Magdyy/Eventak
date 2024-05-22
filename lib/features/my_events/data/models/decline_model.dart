class DeclineModel {
  final String status;
  final String message;

  DeclineModel({
    required this.status,
    required this.message,
  });
  factory DeclineModel.fromJson(Map jsonData) {
    return DeclineModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }}