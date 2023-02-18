import 'dart:convert';
import 'package:http/http.dart' as http;

class Country {
  final String code;
  final String name;

  Country({required this.code, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(code: json['code'], name: json['country']);
  }
}

Future<List<Country>> fetchCountries() async {
  final response = await http.get(Uri.https('restcountries.com', '/v2/all'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    final countries = jsonData.map((json) => Country(
      code: json['alpha2Code'],
      name: json['name'],
    )).toList();
    return countries;
  } else {
    throw Exception('Failed to load countries');
  }
}

