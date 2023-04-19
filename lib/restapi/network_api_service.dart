import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/adapter.dart';

import '../utils/constants.dart';
import 'base_api_services.dart';
import 'dioexception.dart';
import 'logger_interceptor.dart';

class NetworkApiService extends BaseApiServices {
  NetworkApiService()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Constants().baseUrl,
            connectTimeout: 5000,
            receiveTimeout: 3000,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            LoggerInterceptor(),
          ]);
  final Dio _dio;

  static final NetworkApiService _apiServiceInstance = NetworkApiService();

  static NetworkApiService get apiServicesInstance => _apiServiceInstance;

  @override
  Future callDeleteApiResponse(
      {required String url,
      required body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders}) {
    // TODO: implement callDeleteApiResponse
    throw UnimplementedError();
  }

  @override
  Future callGetApiResponse(
      {required String url,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        //  call here
        Response response = await _dio.get(url,
            options: Options(headers: myHeaders), queryParameters: parameters);

        return response;
      } else {
        //Toasts.getWarningToast(text: "No Internet Connection Available :(");
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e.toString();
    }
  }

  @override
  Future callPostApiResponse(
      {required String url,
      required body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response response = await _dio.post(url,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        return response;
      } else {
        //Toasts.getWarningToast(text: "No Internet Connection Available :(");
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e.toString();
    }
  }

  @override
  Future callPutApiResponse(
      {required String url,
      required body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders}) async {
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response response = await _dio.put(url,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        return response;
      } else {
        //Toasts.getWarningToast(text: "No Internet Connection Available :(");
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw e.toString();
    }
  }
}
