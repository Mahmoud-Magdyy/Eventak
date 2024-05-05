

class RecevedCodeModel {
  final String message;

  RecevedCodeModel({
    required this.message,
  });
  factory RecevedCodeModel.fromJson(Map<String, dynamic> jsonData) {
    return RecevedCodeModel(
      message: jsonData['message'],
    );
  }
}
