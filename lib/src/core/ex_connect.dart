import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

abstract class _ExConnectInterface with GetLifeCycleBase {
  List<GetSocket>? sockets;
  GetHttpClient get httpClient;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  });

  Future<Response<T>> request<T>(
    String url,
    String method, {
    dynamic body,
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  });

  Future<Response<T>> post<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  });

  Future<Response<T>> put<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  });

  Future<Response<T>> delete<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  });

  Future<Response<T>> patch<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  });

  Future<GraphQLResponse<T>> query<T>(
    String query, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  });

  Future<GraphQLResponse<T>> mutation<T>(
    String mutation, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  });

  GetSocket socket(String path, {Duration ping = const Duration(seconds: 5)});
}

class ExConnect extends _ExConnectInterface {
  ExConnect({
    this.userAgent = 'ex-client',
    this.timeout = const Duration(seconds: 5),
    this.followRedirects = true,
    this.maxRedirects = 5,
    this.sendUserAgent = false,
    this.maxAuthRetries = 1,
    this.allowAutoSignedCert = false,
    this.withCredentials = false,
  }) {
    $configureLifeCycle();
  }

  bool allowAutoSignedCert;
  String userAgent;
  bool sendUserAgent;
  String? baseUrl;
  String defaultContentType = 'application/json; charset=utf-8';
  bool followRedirects;
  int maxRedirects;
  int maxAuthRetries;
  Decoder? defaultDecoder;
  Duration timeout;
  List<TrustedCertificate>? trustedCertificates;
  String Function(Uri url)? findProxy;
  GetHttpClient? _httpClient;
  List<GetSocket>? _sockets;
  bool withCredentials;

  @override
  List<GetSocket> get sockets => _sockets ??= <GetSocket>[];

  @override
  GetHttpClient get httpClient => _httpClient ??= GetHttpClient(
        userAgent: userAgent,
        sendUserAgent: sendUserAgent,
        timeout: timeout,
        followRedirects: followRedirects,
        maxRedirects: maxRedirects,
        maxAuthRetries: maxAuthRetries,
        allowAutoSignedCert: allowAutoSignedCert,
        baseUrl: baseUrl,
        trustedCertificates: trustedCertificates,
        withCredentials: withCredentials,
        findProxy: findProxy,
      );

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();
    return httpClient.request<T>(
      path,
      'get',
      headers: header,
      query: query,
      body: body,
      decoder: decoder,
      contentType: contentType,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    Progress? uploadProgress,
    String? contentType,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();
    return httpClient.request<T>(
      path,
      'post',
      headers: header,
      body: body,
      query: query,
      uploadProgress: uploadProgress,
      decoder: decoder,
      contentType: contentType,
    );
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    Progress? uploadProgress,
    String? contentType,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();
    return httpClient.request<T>(
      path,
      'put',
      headers: header,
      body: body,
      query: query,
      uploadProgress: uploadProgress,
      decoder: decoder,
      contentType: contentType,
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();
    return httpClient.request<T>(
      path,
      'patch',
      headers: header,
      body: body,
      query: query,
      decoder: decoder,
      contentType: contentType,
    );
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
    _checkIfDisposed();
    return httpClient.request<T>(
      url,
      method,
      body: body,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
      uploadProgress: uploadProgress,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Map<String, String>? header,
    dynamic query,
    dynamic body,
    String? contentType,
    Decoder<T>? decoder,
  }) {
    _checkIfDisposed();
    return httpClient.request<T>(
      path,
      'delete',
      headers: header,
      body: body,
      query: query,
      decoder: decoder,
      contentType: contentType,
    );
  }

  @override
  GetSocket socket(
    String path, {
    Duration ping = const Duration(seconds: 5),
  }) {
    _checkIfDisposed(isHttp: false);

    final newSocket = GetSocket(_concatUrl(path)!, ping: ping);
    sockets.add(newSocket);
    return newSocket;
  }

  String? _concatUrl(String? url) {
    if (url == null) return baseUrl;
    return baseUrl == null ? url : baseUrl! + url;
  }

  /// query allow made GraphQL raw querys
  /// final connect = ExConnect();
  /// connect.baseUrl = 'https://countries.trevorblades.com/';
  /// final response = await connect.query(
  /// r"""
  /// {
  ///  country(code: "BR") {
  ///    name
  ///    native
  ///    currency
  ///    languages {
  ///      code
  ///      name
  ///    }
  ///  }
  ///}
  ///""",
  ///);
  ///print(response.body);
  @override
  Future<GraphQLResponse<T>> query<T>(
    String query, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await post(
        url ?? '',
        body: {'query': query, 'variables': variables},
        header: headers,
      );

      final listError = res.body['errors'];
      if ((listError is List) && listError.isNotEmpty) {
        return GraphQLResponse<T>(
          graphQLErrors: listError
              .map(
                (e) => GraphQLError(
                  code: e['extensions']['code']?.toString(),
                  message: e['message']?.toString(),
                ),
              )
              .toList(),
        );
      }
      return GraphQLResponse<T>.fromResponse(res);
    } on Exception catch (_) {
      return GraphQLResponse<T>(
        graphQLErrors: [GraphQLError(message: _.toString())],
      );
    }
  }

  @override
  Future<GraphQLResponse<T>> mutation<T>(
    String mutation, {
    String? url,
    Map<String, dynamic>? variables,
    Map<String, String>? headers,
  }) async {
    try {
      final res = await post(
        url ?? '',
        body: {'query': mutation, 'variables': variables},
        header: headers,
      );

      final listError = res.body['errors'];
      if ((listError is List) && listError.isNotEmpty) {
        return GraphQLResponse<T>(
          graphQLErrors: listError
              .map(
                (e) => GraphQLError(
                  code: e['extensions']['code']?.toString(),
                  message: e['message']?.toString(),
                ),
              )
              .toList(),
        );
      }
      return GraphQLResponse<T>.fromResponse(res);
    } on Exception catch (_) {
      return GraphQLResponse<T>(
        graphQLErrors: [GraphQLError(message: _.toString())],
      );
    }
  }

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  void _checkIfDisposed({bool isHttp = true}) {
    if (_isDisposed) {
      final error = ArgumentError('Can not emit events to disposed clients!');
      throw error;
    }
  }

  void dispose() {
    if (_sockets != null) {
      for (final socket in sockets) {
        socket.close();
      }
      _sockets?.clear();
      sockets = null;
    }
    if (_httpClient != null) {
      httpClient.close();
      _httpClient = null;
    }
    _isDisposed = true;
  }
}
