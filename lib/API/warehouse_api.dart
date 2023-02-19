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
    String? fax,
    required String country,
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
          'country': country,
        }));

    if (response.statusCode != 200) {
      throw Exception('Failed to add warehouse');
    }
  }

  static Future<void> deleteWarehouse(int warehouseId) async {
    final response = await http.delete(
        Uri.parse('$apiUrl/warehouses/$warehouseId'),
        headers: {'DOLAPIKEY': apiKey});

    if (response.statusCode != 200) {
      throw Exception('Failed to delete warehouse');
    }
  }

  static Future<void> updateWarehouse({
    required int warehouseId,
    String? label,
    String? description,
    String? status,
    String? address,
    String? zip,
    String? town,
    String? phone,
    String? fax,
    String? country,
  }) async {
    final response =
        await http.put(Uri.parse('$apiUrl/warehouses/$warehouseId'),
            headers: {
              'Content-Type': 'application/json',
              'DOLAPIKEY': apiKey,
            },
            body: json.encode({
              if (label != null) 'label': label,
              if (description != null) 'description': description,
              if (status != null) 'statut': status,
              if (address != null) 'address': address,
              if (zip != null) 'zip': zip,
              if (town != null) 'town': town,
              if (phone != null) 'phone': phone,
              if (fax != null) 'fax': fax,
              if (country != null) 'country': country,
            }));

    if (response.statusCode != 200) {
      throw Exception('Failed to update warehouse');
    }
  }
}
