
class AiModel {
  final String message;

  AiModel({
    required this.message,
  });
  factory AiModel.fromJson(Map<String, dynamic> jsonData) {
    return AiModel(
      message: jsonData['message'],
    );
  }
}