class DeleteAccountModel {
  final String status;

  DeleteAccountModel({
    required this.status,
  });
  factory DeleteAccountModel.fromJson(Map jsonData) {
    return DeleteAccountModel(
      status: jsonData['message'],
    );
  }}