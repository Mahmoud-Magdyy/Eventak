
class CreateEventModel {
  final String status;
  final Map<String,dynamic> data;

  CreateEventModel({
    required this.status,
    required this.data,
  });
  factory CreateEventModel.fromJson(Map jsonData) {
    return CreateEventModel(
      status: jsonData['status'],
      data: jsonData['data'],
    );
  }
}
