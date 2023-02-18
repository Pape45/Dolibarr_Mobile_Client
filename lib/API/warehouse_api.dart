import 'dart:convert';
import 'package:http/http.dart' as http;

class WarehouseApi {
  static const String apiUrl = 'http://localhost/dolibarr16-04/api/index.php';
  static const String apiKey = 'ed2fcd1305854bbb87dc9761c053a3dea5fbcee8';

  static Future<List<Map<String, dynamic>>> getWarehouses() async {
    final response = await http.get(
        Uri.parse(
            '$apiUrl/warehouses?sortfield=t.rowid&sortorder=ASC&limit=100'),
        headers: {'DOLAPIKEY': apiKey});

    if (response.statusCode == 200) {
      final List<dynamic> warehousesJson = json.decode(response.body);
      return warehousesJson.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load warehouses');
    }
  }

  static Future<void> addWarehouse({
    required String label,
    String? description,
    String? status,
    String? address,
    String? zip,
    required String town,
    String? phone,
    String? fax, required String country,
  }) async {
    final response = await http.post(Uri.parse('$apiUrl/warehouses'),
        headers: {
          'Content-Type': 'application/json',
          'DOLAPIKEY': apiKey,
        },
        body: json.encode({
          'label': label,
          'description': description,
          'statut': status,
          'address': address,
          'zip': zip,
          'town': town,
          'phone': phone,
          'fax': fax,
        }));

    if (response.statusCode != 200) {
      throw Exception('Failed to add warehouse');
    }
  }
}
