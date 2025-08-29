import 'api_client.dart';

class ApiManager {
  static final Map<String, ApiClient> _clients = {};

  // Registrar una API
  static void register({
    required String name,
    required String baseUrl,
    Duration timeout = const Duration(seconds: 30),
    Map<String, String>? headers,
  }) {
    _clients[name] = ApiClient.create(
      name: name,
      baseUrl: baseUrl,
      timeout: timeout,
      headers: headers,
    );
  }

  // Obtener un cliente específico
  static ApiClient get(String name) {
    final client = _clients[name];
    if (client == null) {
      throw Exception('API client "$name" no está registrada');
    }
    return client;
  }

  // Verificar si existe
  static bool exists(String name) => _clients.containsKey(name);
}
