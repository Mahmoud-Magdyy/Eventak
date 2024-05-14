import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(ImageSource source) async {
  XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}
Future uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
Future<List<MultipartFile>> uploadImagesToAPI(List<XFile> images) async {
  List<MultipartFile> multipartFiles = [];
  
  for (XFile image in images) {
    MultipartFile multipartFile = await MultipartFile.fromFile(image.path,
        filename: image.path.split('/').last);
    multipartFiles.add(multipartFile);
  }
  
  return multipartFiles;
}
// Future<List<XFile?>> pickMultiImage(ImageSource source) async {
//   List<XFile?> multiImage = await ImagePicker().pickMultiImage();
//   if (multiImage!.isNotEmpty) {
//     multiImage.addAll(value)
//   } else {
//     return null;
//   }
// }
