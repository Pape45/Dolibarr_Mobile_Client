import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dolibarr_mobile_client/model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class UserApi {
  static const _baseUrl = 'http://localhost/dolibarr16-04/api/index.php';
  // Emulator link :
  //static const _baseUrl = 'http://"IP ADDRESS"/dolibarr16-04/api/index.php';

  static Future<User> fetchUser(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'login': username,
        'password': password,
        'reset': '0',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['success']['token'] as String;
      final user = User.fromJson(data);
      // Store the user's token in the FlutterSecureStorage
      await FlutterSecureStorage().write(key: 'token', value: token);
      // Return the User instance without the token
      return User(
        code: user.code,
        entity: user.entity,
        message: user.message,
        token: user.token
      );
    } else {
      throw Exception('Failed to login');
    }
  }
}
