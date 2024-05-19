class DeleteModel {
  final String status;

  DeleteModel({
    required this.status,
  });
  factory DeleteModel.fromJson(Map jsonData) {
    return DeleteModel(
      status: jsonData['status'],
    );
  }}