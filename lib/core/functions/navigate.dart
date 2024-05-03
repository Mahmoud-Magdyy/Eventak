import 'package:flutter/material.dart';

// void customNavigate(context,String path,{Object? arguments}){
//   GoRouter.of(context).push(path);
// }
// void customReplacementNavigate(context,String path){
//   GoRouter.of(context).pushReplacement(path);
// }
void navigate({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushNamed(
    context,
    route,
    arguments: arg,
  );
}

void navigateReplacment({
  required BuildContext context,
  required String route,
  dynamic arg,
}) {
  Navigator.pushReplacementNamed(
    context,
    route,
    arguments: arg,
  );
}