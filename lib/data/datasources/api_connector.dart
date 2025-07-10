import 'package:http/http.dart' as http;

class ApiConnector {
  // static Uri api = Uri.parse('https://stock-market-api-zw2g.onrender.com/');
  static Uri api = Uri.parse('https://stock-market-api-zw2g.onrender.com');

  static Future<http.Response> get(Uri route) {
    return http.get(api.resolveUri(route));
  }

  static Future<http.Response> post(Uri route, Object data) {
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
