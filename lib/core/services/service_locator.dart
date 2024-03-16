import 'package:eventak/core/bloc/cubit/global_cubit.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';


final sl=GetIt.instance;

Future<void> setupServiceLocator() async{
   sl.registerLazySingleton(() => CacheHelper());
   sl.registerLazySingleton(() => GlobalCubit());
}