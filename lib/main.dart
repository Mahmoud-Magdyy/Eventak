import 'package:device_preview/device_preview.dart';
import 'package:eventak/app/my_app.dart';
import 'package:eventak/core/bloc/bloc_observer.dart';
import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await sl<CacheHelper>().init();
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: false,
      builder: ((context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<GlobalCubit>()..getCachedLang(),
              ),
              BlocProvider(
                create: (context) => sl<HomeCubit>()..getAllEvents(categoryName: '')..getTrendigEvents(),
              ),
              BlocProvider(
                create: (context) => sl<CreateEventCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<MyCreatedEventsCubit>()..getMyCreatedEvents(),
              ),
              BlocProvider(
                create: (context) => sl<SignInCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<RegisterCubit>(),
              ),
              BlocProvider(
                create: (context) => sl<ResetPasswordCubit>(),
              ),
            ],
            child: const MyApp(),
          )),
    ),
  );
}
