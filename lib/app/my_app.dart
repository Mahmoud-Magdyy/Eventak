import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
    );
  }
}
