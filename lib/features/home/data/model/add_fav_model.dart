class AddFavModel {
  final bool message;

  AddFavModel({
    required this.message,
  });
  factory AddFavModel.fromJson(Map jsonData) {
    return AddFavModel(
      message: jsonData['isFavourite'],
    );
  }}