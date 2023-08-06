import 'package:dio/dio.dart';

class HttpManager{
  Future<Map> request({
    required String url,
    required String method,
    Map? headers,
    Map? body,
    Map<String, dynamic>? queryparameters,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      });

      Dio dio = Dio();

      try{
        Response response = await dio.request(url,
            options: Options(
              headers: defaultHeaders,
              method: method,
            ),
            data: body,
            queryParameters: queryparameters);

            return response.data;
      } on DioException catch (error){
        return error.response?.data ?? {};
      } catch(error){
        return {};
      }
  }

  Future<Map> requestList({
    required String url,
    required String method,
    Map? headers,
    Map? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
        ..addAll({
          'Content-Type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
        });

        Dio dio = Dio();

        try{
          Response response = await dio.request(url,
          options: Options(
            headers: defaultHeaders,
            method: method,
          ),
          data: body,
          queryParameters: queryParameters);

          return response.data;
        } on DioException catch(error){
          return error.response?.data ?? {}; 
        } catch(error){
          return {};
        }
  }
}

abstract class HttpMethods{
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
}