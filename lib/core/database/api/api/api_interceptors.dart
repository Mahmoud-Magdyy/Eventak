
import 'package:dio/dio.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/services/service_locator.dart';


class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers[Apikeys.token] = sl<CacheHelper>().getData(key: Apikeys.token) != null
        ? 'FOODAPI ${sl<CacheHelper>().getData(key: Apikeys.token)}'
        : null;
    // options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    

    super.onRequest(options, handler);
  }
}
