import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> login(String email, String password) async {
    var url = Uri.parse('$baseUrl/login.php');
    var response = await http.post(url, body: {
      'action': 'login',
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<Map<String, dynamic>> register(
      String username, String email, String password) async {
    var url = Uri.parse('$baseUrl/register.php');
    var response = await http.post(url,
        body: {'username': username, 'email': email, 'password': password});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to connect to the server');
    }
  }
}
