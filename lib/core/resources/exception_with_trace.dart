import 'dart:core';

class ExceptionWithTrace {
  final Exception exception;
  final StackTrace trace;

  ExceptionWithTrace(this.exception, this.trace);

  @override
  String toString() => 'Возникло исключение: $exception}';
}
