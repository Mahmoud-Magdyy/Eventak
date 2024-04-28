import 'package:image_picker/image_picker.dart';

Future<XFile?> pickImage(ImageSource source) async {
  XFile? image = await ImagePicker().pickImage(source: source);
  if (image != null) {
    return image;
  } else {
    return null;
  }
}
// Future<List<XFile?>> pickMultiImage(ImageSource source) async {
//   List<XFile?> multiImage = await ImagePicker().pickMultiImage();
//   if (multiImage!.isNotEmpty) {
//     multiImage.addAll(value)
//   } else {
//     return null;
//   }
// }
