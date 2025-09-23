import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//تكريت اوبجيكت دايو واحد فقط ويرجعلك ياه ويمنع كريتت اوبجيكت تانس يعني سينغيلتون
class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 5);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
