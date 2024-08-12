import 'dart:convert';

import 'package:do_app/models/result.dart';
import 'package:http/http.dart'as http;

class ApiDataProvider {
  static const mainUrl = "http://192.168.7.55/api";
  final http.Client httpClient = http.Client(); 

  Future<Result> login(
      {required String nom, required String password}) async {
    try {
      var response = await http.post(Uri.parse('$mainUrl/login.php'),
          body: {"nom": nom, "password": password});
      final json = jsonDecode(response.body);
      print(response.body);
      print(json);
      return Result.fromJson(json);
    } catch (e) {
      return Result(error: true, message: e.toString());
    }
  }

}