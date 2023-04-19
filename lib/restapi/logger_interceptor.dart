import 'package:dio/dio.dart';
import 'package:ev_verde/utils/constants.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggerInterceptor extends Interceptor {
  Logger logger = Logger(
    // Customize the printer
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: false,
    ),
  );

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logger.e('${options.method} request => $requestPath');  // Debug log
    logger.d('Error: ${err.error}, Message: ${err.response?.data}'); // Error log
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final requestPath = '${options.baseUrl}${options.path}';
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants().token);
    options.headers['Authorization'] = 'bearer $token';
    logger.i('${options.method} request => $requestPath'); // Info log
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d('StatusCode: ${response.statusCode}, Data: ${response.data}'); // Debug log
    return super.onResponse(response, handler);
  }
}