import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';


final sl=GetIt.instance;

Future<void> setupServiceLocator() async{
   sl.registerLazySingleton(() => CacheHelper());
   sl.registerLazySingleton(() => GlobalCubit());
   sl.registerLazySingleton(() => SignInCubit());
   sl.registerLazySingleton(() => HomeCubit());
   sl.registerLazySingleton(() => RegisterCubit());
   sl.registerLazySingleton(() => ResetPasswordCubit());
}