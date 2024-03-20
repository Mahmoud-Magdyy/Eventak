import 'package:device_preview/device_preview.dart';
import 'package:eventak/app/my_app.dart';
import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await sl<CacheHelper>().init();

  runApp(
    DevicePreview(
      enabled: false,
      builder: ((context) => MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => sl<GlobalCubit>()..getCachedLang(),
            ),
          ], child: const MyApp())),
    ),
  );
}
