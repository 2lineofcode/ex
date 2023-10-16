import 'package:dio/dio.dart';
import 'package:ex/ex.dart';

class Dioo {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  Dioo._internal();

  static final _singleton = Dioo._internal();

  factory Dioo() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      receiveTimeout: 15.seconds,
      connectTimeout: 15.seconds,
      sendTimeout: 15.seconds,
    ));

    dio.interceptors.addAll({AppInterceptors(dio)});
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        'Request Time out';
        break;
      case DioExceptionType.sendTimeout:
        'Request Time out';
        break;
      case DioExceptionType.receiveTimeout:
        'Request Time out';
        break;
      case DioExceptionType.badCertificate:
        'Invalid request';
        break;
      case DioExceptionType.badResponse:
        'Bad Response';
        break;
      case DioExceptionType.cancel:
        'Cancel';
        break;
      case DioExceptionType.connectionError:
        'connectionError';
        break;
      case DioExceptionType.unknown:
        'No internet connection detected, please try again';
        break;
    }
    return handler.next(err);
  }
}
