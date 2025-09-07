



import 'errors_types_enum.dart';

abstract class DataState<T> {
  final T? data;
  final ExceptionResponse? exceptionResponse;

  const DataState({this.data, this.exceptionResponse});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed extends DataState {
  const DataFailed(ExceptionResponse error) : super(exceptionResponse: error);
}
