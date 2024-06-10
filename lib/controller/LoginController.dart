import 'package:exercise2/service/AuthService.dart';
import 'package:flutter/material.dart';

class LoginController {
  final ApiService apiService;

  LoginController(this.apiService);

  Future<bool> login(String email, String password) async {
    try {
      var response = await apiService.login(email, password);
      if (response['status'] == 'success') {
        return true;
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
