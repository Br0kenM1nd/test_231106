import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../resources/data_state.dart';

typedef RequestFunction = Future<HttpResponse> Function();

Future<DataState<T>> handleRequest<T>(RequestFunction request) async {
  try {
    final res = await request();

    return res.response.statusCode == HttpStatus.ok
        ? DataSuccess(res.data)
        : DataFailed(res.dioEx, StackTrace.current);
  } on DioException catch (ex) {
    log(ex.toString());
    return DataFailed(ex, ex.stackTrace);
  } catch (ex, trace) {
    log(ex.toString());
    log(trace.toString());
    return DataFailed(ex, trace);
  }
}
