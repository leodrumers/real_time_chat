import 'dart:convert';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/model/login_response.dart';
import 'package:chat_app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  User user;
  bool _logging = false;
  final _storage = new FlutterSecureStorage();

  bool get logging => _logging;

  set logging(bool value) {
    _logging = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    final _storage = new FlutterSecureStorage();
    String token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login(String email, String password) async {
    this.logging = true;
    final data = {'email': email, 'password': password};

    final resp = await http.post('${Environment.apiUrl}/login',
        body: jsonEncode(data), headers: {'Content-type': 'application/json'});
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      await _saveToken(loginResponse.token);
      return true;
    } else {
      this.logging = false;
      return jsonDecode(resp.body)['msg'];
    }
  }

  Future register(String name, String email, String password) async {
    this.logging = true;
    final data = {'name': name, 'email': email, 'password': password};

    final resp = await http.post('${Environment.apiUrl}/login/new',
        body: jsonEncode(data), headers: {'Content-type': 'application/json'});
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      await _saveToken(loginResponse.token);
      return true;
    } else {
      this.logging = false;
      return jsonDecode(resp.body)['msg'];
    }
  }

  Future isLoggedIn() async {
    final token = await this._storage.read(key: 'token');
    final resp = await http.get('${Environment.apiUrl}/login/renew',
        headers: {'Content-type': 'application/json', 'x-token': token});
    if (resp.statusCode == 200) {
      final loginResponse = loginResponseFromJson(resp.body);
      this.user = loginResponse.user;
      await _saveToken(loginResponse.token);
      return true;
    } else {
      this._logout();
      return false;
    }
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future _logout() async {
    await _storage.delete(key: 'token');
  }
}
