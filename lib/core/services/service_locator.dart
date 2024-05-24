import 'package:dio/dio.dart';
import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/dio_consumer.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/features/auth/data/reposatiry/auth_repository.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:eventak/features/create_event/data/reposatiry/event_repo.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/home/data/reposatiory/add_register_repo.dart';
import 'package:eventak/features/home/data/reposatiory/add_to_favourit_repo.dart';
import 'package:eventak/features/home/data/reposatiory/get_all_events_repo.dart';
import 'package:eventak/features/home/data/reposatiory/get_trending_events.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/data/reposatiory/model_repo.dart';
import 'package:eventak/features/my_events/data/reposatiory/my_events_repo.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
import 'package:eventak/features/profile/data/reposatoriy/favourite_repo.dart';
import 'package:eventak/features/profile/data/reposatoriy/profile_repo.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:eventak/features/setting/data/reposatiory/logout_repo.dart';
import 'package:eventak/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:get_it/get_it.dart';


final sl=GetIt.instance;

Future<void> setupServiceLocator() async{
   sl.registerLazySingleton(() => CacheHelper());
   sl.registerLazySingleton(() => GlobalCubit());
   sl.registerLazySingleton(() => EditEventCubit());
   sl.registerLazySingleton(() => SignInCubit(sl()));
   sl.registerLazySingleton(() => HomeCubit(sl(),sl(),sl(),sl()));
   sl.registerLazySingleton(() => GetAllEventsReposatiry());
   sl.registerLazySingleton(() => AddRegisterReposatiry());
   sl.registerLazySingleton(() => GetTrendigEventsReposatiry());
   sl.registerLazySingleton(() => AddToFavouritReposatiry());
   sl.registerLazySingleton(() => AuthRepository());
   sl.registerLazySingleton(() => SettingCubit(sl()));
   sl.registerLazySingleton(() => LogOutReposatiry());
   sl.registerLazySingleton(() => ProfileCubit(sl(),sl()));
   sl.registerLazySingleton(() => ProfileReposatiry());
   sl.registerLazySingleton(() => GetMyFavouritesEventsReposatiry());
   sl.registerLazySingleton(() => CreateEventReposatiry());
   sl.registerLazySingleton(() => ModelUserReposatiry());
   sl.registerLazySingleton(() => MyCreatedEventsCubit(sl(),sl()));
   sl.registerLazySingleton(() => GetMyCreatedEventsReposatiry());
   sl.registerLazySingleton(() => CreateEventCubit(sl(),''));
   sl.registerLazySingleton(() => RegisterCubit(sl()));
   sl.registerLazySingleton(() => ResetPasswordCubit(sl()));
   sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(sl()));
  sl.registerLazySingleton(() => Dio());
}