class RemoveFavModel {
  final String message;

  RemoveFavModel({
    required this.message,
  });
  factory RemoveFavModel.fromJson(Map jsonData) {
    return RemoveFavModel(
      message: jsonData['message'],
    );
  }}