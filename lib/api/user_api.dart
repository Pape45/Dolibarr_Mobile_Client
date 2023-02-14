import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dolibarr_mobile_client/model/user.dart';

class UserApi {
  static const _baseUrl = 'http://localhost/dolibarr16-04/api/index.php';
  // Emulator link :
  //static const _baseUrl = 'http://154.65.37.4/dolibarr16-04/api/index.php';

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
      return User.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }
}
