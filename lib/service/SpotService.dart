import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exercise2/model/Spot.dart';

class SpotService {
  final String baseUrl = 'http://192.168.0.122/exercise2/';

  Future<List<Spot>> getData() async {
    final response = await http.get(Uri.parse('$baseUrl/read.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((spot) => Spot.fromMap(spot)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.post(
      Uri.parse('$baseUrl/delete.php'),
      body: {"id": id},
    );
    return response.statusCode == 200;
  }
}
