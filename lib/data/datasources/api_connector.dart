import 'package:http/http.dart' as http;

class ApiConnector {
  // static Uri api = Uri.parse('https://stock-market-api-zw2g.onrender.com/');
  static Uri api = Uri.parse('http://localhost:8080/');

  static Future<T> get<T>(Uri route) async {
    return http.get(api.resolveUri(route)).then((response) {
      if (response.statusCode == 200) {
        return response.body as T;
      } else {
        throw Exception('Failed to load data');
      }
    });
  }

  static Future<http.Response> post<T extends Object>(
    Uri route,
    Object data,
  ) async {
    return http.post(
      api.resolveUri(route),
      headers: <String, String>{},
      body: data,
    );
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
