import 'package:exercise2/service/AuthService.dart';
import 'package:flutter/material.dart';

class RegisterController {
  final ApiService apiService;

  RegisterController(this.apiService);

  Future<bool> register(String username, String email, String password) async {
    try {
      var response = await apiService.register(username, email, password);
      if (response['status'] == 'success') {
        return true;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }
}
