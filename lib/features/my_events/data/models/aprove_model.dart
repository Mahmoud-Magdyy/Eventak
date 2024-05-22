class AproveModel {
  final String status;
  final String message;

  AproveModel({
    required this.status,
    required this.message,
  });
  factory AproveModel.fromJson(Map jsonData) {
    return AproveModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }}