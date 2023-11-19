import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_231106/core/resources/exception_with_trace.dart';

abstract class DataState<T> {
  final T? data;
  final ExceptionWithTrace? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(exception, stackTrace)
      : super(error: ExceptionWithTrace(exception, stackTrace));
}

extension DioExt on HttpResponse {
  DioException get dioEx => DioException(
        error: response.statusMessage,
        requestOptions: response.requestOptions,
        response: response,
      );
}
