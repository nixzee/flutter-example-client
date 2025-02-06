// ignore: use_string_in_part_of_directives
part of api.client.example;

class ApiClient {
  late Dio _dio;
  String _host = "";
  bool _tlsEnabled = false;
  static ApiClient? _instance;

  factory ApiClient({
    required String host,
    bool tlsEnabled = false,
  }) {
    _instance ??= ApiClient._internal(
      host: host,
      tlsEnabled: tlsEnabled,
    );
    return _instance!;
  }

  ApiClient._internal({
    required String host,
    bool tlsEnabled = false,
  }) {
    _dio = Dio(BaseOptions(
      baseUrl: tlsEnabled ? 'https://$host' : 'http://$host',
      connectTimeout: Duration(milliseconds: 3000),
      receiveTimeout: Duration(milliseconds: 3000),
    ));
  }

  static ApiClient get instance {
    return _instance!;
  }

  set host(String host) {
    _host = host;
    _dio.options.baseUrl = _tlsEnabled ? 'https://$_host' : 'http://$_host';
  }

  set tlsEnabled(bool enabled) {
    _tlsEnabled = enabled;
    _dio.options.baseUrl = enabled ? 'https://$_host' : 'http://$_host';
  }

  set connTimeout(int timeout) {
    _dio.options.connectTimeout = Duration(milliseconds: timeout);
  }

  set recvTimeout(int timeout) {
    _dio.options.receiveTimeout = Duration(milliseconds: timeout);
  }

  Future<Response> invoke({
    required String endpoint,
    required String method,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      switch (method.toUpperCase()) {
        case 'GET':
          return _dio.get(
            endpoint,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
        case 'POST':
          return _dio.post(
            endpoint,
            data: body,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
        case 'PUT':
          return _dio.put(
            endpoint,
            data: body,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
        case 'DELETE':
          return _dio.delete(
            endpoint,
            data: body,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
        default:
          throw Exception('Invalid method');
      }
    } on DioException catch (e) {
      return e.response!;
    }
  }
}
