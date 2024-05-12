class AddFavModel {
  final String message;

  AddFavModel({
    required this.message,
  });
  factory AddFavModel.fromJson(Map jsonData) {
    return AddFavModel(
      message: jsonData['message'],
    );
  }}