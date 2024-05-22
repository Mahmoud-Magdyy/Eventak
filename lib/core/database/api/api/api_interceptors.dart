

import 'package:dio/dio.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/my_events/data/models/get_users_model.dart';
import 'package:eventak/features/my_events/data/models/requested_model.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';


class ApiInterceptors extends Interceptor {
   UserModel? userModel;
    RequestedInMyEventsModel? myRequestedEventModel;
    MyCreatedEventsCubit? myCreatedEventsCubit;
    
  @override
  void onRequest(
    
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token) != null
        ? 'project__${sl<CacheHelper>().getData(key: Apikeys.token)}'
        : null;
    // options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    // options.headers['x-name'] = myRequestedEventModel?.nameOfEvent != null
    //     ? myRequestedEventModel!.nameOfEvent 
    //     : null;

     
    super.onRequest(options, handler);
  }
}
