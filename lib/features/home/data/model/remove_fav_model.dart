class RemoveFavModel {
  final bool message;

  RemoveFavModel({
    required this.message,
  });
  factory RemoveFavModel.fromJson(Map jsonData) {
    return RemoveFavModel(
      message: jsonData['isFavourite'],
    );
  }}