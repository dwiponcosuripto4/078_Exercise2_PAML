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

  Future<bool> addSpot(Spot spot) async {
    Map<String, dynamic> data = {
      'namaTempat': spot.namaTempat,
      'jenisKuliner': spot.jenisKuliner,
      'makananFavorit': spot.makananFavorit,
      'minumanFavorit': spot.minumanFavorit,
      'noTelepon': spot.noTelepon,
      'lokasi': spot.lokasi,
      'jamBuka': spot.jamBuka,
      'jamTutup': spot.jamTutup,
      'rating': spot.rating,
    };

    final response = await http.post(
      Uri.parse('$baseUrl/create.php'),
      body: data,
    );

    return response.statusCode == 200;
  }

  Future<bool> updateSpot(Spot spot) async {
    Map<String, dynamic> data = spot.toMap();
    final response = await http.post(
      Uri.parse('$baseUrl/update.php'),
      body: data,
    );
    return response.statusCode == 200;
  }
}
