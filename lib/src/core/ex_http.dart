import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import '../../ex.dart';
import 'ex_connect.dart';

enum Method { get, post, put, patch, delete, head, connect, options, trace }

class ExHttp extends ExConnect {
  ExHttp({
    this.baseURL,
    this.baseHeader,
    this.allowAutoSignedCertificate = true,
    this.useUserAgent = false,
    this.customUserAgent = 'ex-api',
    this.allowFollowRedirects = false,
    this.maxRedirectURL = 3,
    this.maxAuthRetry = 3,
    this.maxTimeOut,
    this.interceptorAddRequestModifier,
    this.interceptorAddAuthenticator,
    this.interceptorAddResponseModifier,
  });

  String? baseURL;
  Map<String, String>? baseHeader;
  bool allowAutoSignedCertificate;
  String customUserAgent;
  bool useUserAgent;
  bool allowFollowRedirects;
  int maxRedirectURL;
  int maxAuthRetry;
  Duration? maxTimeOut;
  Function(Request<void>)? interceptorAddAuthenticator;
  Function(Request<void>)? interceptorAddRequestModifier;
  Function(Request<void>, Response<Object?>)? interceptorAddResponseModifier;

  @override
  Future<void> onInit() async {
    HttpOverrides.global = MyHttpOverrides(); // Fix Http Issue on Android SDK < 23

    try {
      allowAutoSignedCert = allowAutoSignedCertificate;

      httpClient
        ..baseUrl = baseURL
        ..errorSafety = true
        ..followRedirects = allowFollowRedirects
        ..timeout = maxTimeOut ?? 15.seconds
        ..maxAuthRetries = maxAuthRetry
        ..maxRedirects = maxRedirectURL
        ..sendUserAgent = useUserAgent
        ..userAgent = customUserAgent;

      /// add something on every http request
      if (interceptorAddRequestModifier != null) {
        httpClient.addRequestModifier<void>((request) async {
          /// [example]
          // final token = PrefHelper.userToken;
          // if (token != null && token.isNotEmpty) {
          //   request.headers['Authorization'] = 'Bearer $token';
          // }
          // request.headers.addAll(baseHeader);
          // return request;
          interceptorAddRequestModifier?.call(request);
          return request;
        });
      }

      /// if (401) -> AUTO REFRESH TOKEN
      if (interceptorAddAuthenticator != null) {
        httpClient.addAuthenticator<void>((request) async {
          /// [example]
          // if (PrefHelper.userRefreshToken.isNotNullOrEmpty) {
          // final response = await httpPost(
          //   url: '/user/v1.0/renew-token',
          //   body: {
          //     'refresh_token': '${PrefHelper.userRefreshToken}',
          //   },
          // );
          // final token = response.body['data']['access_token'];
          // final rToken = response.body['data']['refresh_token'];
          // final gToken = response.body['data']['google_token'];

          // await PrefHelper.setUserToken(token);
          // await PrefHelper.setUserRefreshToken(rToken);
          // await PrefHelper.setUserGoogleToken(gToken);

          // // # re-adjust headers ...
          // request.headers['Authorization'] = '$token';
          // logI('TOKEN REFRESHED!');
          // }
          interceptorAddAuthenticator?.call(request);
          return request;
        });
      }

      /// add something on every http request
      if (interceptorAddResponseModifier != null) {
        httpClient.addResponseModifier((request, response) {
          interceptorAddResponseModifier?.call(request, response);
          return response;
        });
      }
    } on Exception {
      throw ApiException('''
Please Init & Inject ExHttp on main program

== EXAMPLE ==

Get.put(
  ExHttp(
    baseURL: 'https://api.com',
    baseHeader: {},
    maxTimeOut: 30.seconds,
    maxAuthRetry: 5,
    allowFollowRedirects: true,
    showLogHeader: false,
    showLogResponse: false,
  ),
);

''');
    }
    super.onInit();
  }

  @override
  Future<Response<T>> get<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'get', url: path, header: header, query: query, body: body, decoder: decoder, contentType: contentType);
  }

  @override
  Future<Response<T>> post<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, Progress? uploadProgress, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'post', url: path, header: header, query: query, body: body, decoder: decoder, contentType: contentType, uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> put<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, Progress? uploadProgress, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'put', url: path, header: header, query: query, body: body, decoder: decoder, contentType: contentType, uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> patch<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'patch', url: path, header: header, query: query, body: body, decoder: decoder, contentType: contentType);
  }

  @override
  Future<Response<T>> delete<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'delete', url: path, header: header, query: query, body: body, decoder: decoder, contentType: contentType);
  }

  Future<Response<T>> head<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'head', url: path, header: header, query: query, body: body);
  }

  Future<Response<T>> connect<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'connect', url: path, header: header, query: query, body: body);
  }

  Future<Response<T>> options<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'options', url: path, header: header, query: query, body: body);
  }

  Future<Response<T>> trace<T>(String path, {Map<String, String>? header, dynamic query, dynamic body, String? contentType, Decoder<T>? decoder}) async {
    return _httpBase(method: 'trace', url: path, header: header, query: query, body: body);
  }

  @override
  Future<Response<T>> request<T>(
    String url,
    String method, {
    dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    return _httpBase(method: method, url: url, header: headers, query: query, body: body, contentType: contentType, decoder: decoder, uploadProgress: uploadProgress);
  }

  /// template exhttp.download
  ///
  /// await apiService.download(
  ///     'http://speedtest.ftp.otenet.gr/files/test10Mb.db',
  ///     (await getTemporaryDirectory()).path + '/dummy.db',
  ///     method: 'get',
  ///     header: {
  ///       HttpHeaders.acceptEncodingHeader: '*', // Disable gzip
  ///       HttpHeaders.acceptCharsetHeader: '*',
  ///     },
  ///     onReceiveProgress: (count, total) {
  ///       if (total! <= 0) return;
  ///       print('percentage: ${(count / total * 100).toStringAsFixed(0)}%');
  ///     },
  ///   );
  Future<dynamic> download<T>(
    String url,
    String savePath, {
    String method = 'get',
    void Function(int, int?)? onReceiveProgress,
    Map<String, dynamic>? header,
  }) async {
    final httpClient = HttpClient();
    print('${method.toUpperCase()} : $url');

    if (header != null) print('${jsonEncode(header)}');

    try {
      // url & method
      HttpClientRequest request;
      switch (method.toLowerCase()) {
        case 'get':
          request = await httpClient.getUrl(Uri.parse(url));
          break;
        case 'post':
          request = await httpClient.postUrl(Uri.parse(url));
          break;
        default:
          request = await httpClient.getUrl(Uri.parse(url));
          break;
      }

      /// header
      header?.forEach((key, value) => request.headers.add(key, value));

      // onReceiveProgress
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(
        response,
        onBytesReceived: onReceiveProgress ??
            (cumulative, total) {
              if (total != null && total <= 0) return;
              print('downloading: ${(cumulative / total! * 100).toStringAsFixed(0)}%');
            },
      );

      // savePath
      final file = File('$savePath');
      await file.writeAsBytes(bytes);
      print('file downloaded on: ${file.path}');
      return '${file.path}';
    } catch (error) {
      throw ApiException('$error');
    }
  }

  Future<Response<T>> _httpBase<T>({
    required String method,
    String url = '',
    dynamic header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) async {
    if (url.contains('https://')) {
      httpClient.baseUrl = '';
    } else {
      await onInit();
    }

    final res = await httpClient.request<T>(url, '$method', headers: header, query: query, body: body, decoder: decoder, contentType: contentType, uploadProgress: uploadProgress);
    logI('${method.toUpperCase()} : ${res.request?.url}');
    try {
      if (header != null) logI('Header: ${jsonEncode(header)}');
      if (body != null) logI('Body: ${jsonEncode(body)}');
    } catch (e) {
      if (header != null) logI('Header: ${header}');
      if (body != null) logI('Body: ${body}');
    }

    if (res.isOk) {
      return res;
    } else {
      throw ApiException(getErrorMessage(res.statusCode, response: res));
    }
  }

  @override
  void onReady() {
    logW('Api Service Ready!');
    super.onReady();
  }

  @override
  void onClose() {
    logW('Api Service Closed!');
    super.onClose();
  }
}

// —————————————————————————————————————————————————————————————————————————————
// MyHttpOverrides
// —————————————————————————————————————————————————————————————————————————————
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) => super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
}

String getErrorMessage(int? code, {Response<dynamic>? response}) {
  logE('${response?.statusCode} → ${response?.statusText}');
  if (code == null) return 'Request time out';
  switch (code) {
    case 400:
      if (response != null) {
        if (response.body['info'] != null) return '${response.body['info']}';
        if (response.body['data']['info'] != null) return '${response.body['data']['info']}';
        if (response.body['message'] != null) return '${response.body['message']}';
        if (response.body['data']['message'] != null) return '${response.body['data']['message']}';
        if (response.body['error']['message'] != null) return '${response.body['error']['message']}';
        if (response.body['error']['description'] != null) return '${response.body['error']['description']}';
      }
      return 'Bad request ($code)';
    case 401:
      return 'Your session has expired, please log in again ($code)';
    case 403:
      return 'Access Forbidden ($code)';
    case 404:
      return 'Path not found ($code)';
    case 405:
      return 'Method not allowed ($code)';
    case 422:
      return 'The request was well-formed but was unable to be followed due to semantic errors. ($code)';
    case 500:
      return 'Internal Server Error ($code)';
    case 501:
      return 'Not Implemented ($code)';
    case 502:
      return 'Bad Gateway ($code)';
    case 503:
      return 'Service Unavailable ($code)';
    default:
      return '${response?.statusCode} → ${response?.statusText}';
  }
}

class ApiException implements Exception {
  String message;
  ApiException(this.message);
  @override
  String toString() => message;
}
