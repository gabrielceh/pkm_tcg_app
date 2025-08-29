import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;
  final String name;

  ApiClient._(this._dio, this.name);

  // Factory para crear instancias con diferentes configuraciones
  factory ApiClient.create({
    required String name,
    required String baseUrl,
    Duration timeout = const Duration(seconds: 30),
    Map<String, String>? headers,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...?headers,
        },
      ),
    );

    // Log solo en debug
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return ApiClient._(dio, name);
  }

  // GET
  Future<T> get<T>(String path, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(path, queryParameters: params);
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST
  Future<T> post<T>(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // PUT
  Future<T> put<T>(String path, {dynamic data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // DELETE
  Future<T> delete<T>(String path) async {
    try {
      final response = await _dio.delete(path);
      return response as T;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Manejo simple de errores
  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Conexión muy lenta en $name';
      case DioExceptionType.connectionError:
        return 'Sin conexión a $name';
      case DioExceptionType.badResponse:
        return 'Error en $name (${error.response?.statusCode})';
      default:
        return 'Error en $name';
    }
  }

  // Para agregar token de autorización
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Para limpiar el token
  void clearToken() {
    _dio.options.headers.remove('Authorization');
  }

  // Para agregar headers personalizados
  void setHeaders(Map<String, String> headers) {
    _dio.options.headers.addAll(headers);
  }
}
