import 'package:dio/dio.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
void showTwist({required String messege, required ToastStates state}) {
  Fluttertoast.showToast(
      msg: messege,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates {
  error,
  success,
  warning,
}
Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return Colors.red;
    case ToastStates.success:
      return AppColors.primaryColor;
    case ToastStates.warning:
      return Colors.orange;
  }
}