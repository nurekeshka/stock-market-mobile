import 'package:http/http.dart' as http;

class ApiConnector {
  final Uri api = Uri.parse('http://localhost:8080');

  Future<T> get<T>(Uri route) async {
    return http.get(api).then((response) {
      if (response.statusCode == 200) {
        return response.body as T;
      } else {
        throw Exception('Failed to load data');
      }
    });
  }
}

class User {
  final String name;
  final String email;

  User({required this.name, required this.email});
}
