import 'package:device_preview/device_preview.dart';
import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/bloc/cubit/global_state.dart';
import 'package:eventak/core/locale/app_loacl.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return MaterialApp.router(
          builder: DevicePreview.appBuilder,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // GlobalWidgetsLocalizations.delegate,
            AppLocalizations.delegate,
            DefaultMaterialLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('ar', "EG"),
            Locale('en', "US"),
          ],
          locale: Locale(BlocProvider.of<GlobalCubit>(context).langCode),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(context),
        );
      },
    );
  }
}
