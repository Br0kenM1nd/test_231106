import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

extension DioExt on HttpResponse {
  DioException get dioEx => DioException(
        error: response.statusMessage,
        requestOptions: response.requestOptions,
        response: response,
      );
}
