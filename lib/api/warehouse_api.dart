import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dolibarr_mobile_client/model/warehouse.dart';

class WarehouseApi {
  static const _baseUrl = 'http://localhost/dolibarr16-04/api/index.php';
  static const _doliApiKey = 'ed2fcd1305854bbb87dc9761c053a3dea5fbcee8';

  static Future<List<Warehouse>> fetchWarehouses() async {
    final response = await http.get(Uri.parse('$_baseUrl/warehouses?sortfield=t.rowid&sortorder=ASC&limit=100'), headers: {
      'DOLAPIKEY': _doliApiKey,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Warehouse> warehouses = (data['result'] as List<dynamic>).map((warehouseData) => Warehouse.fromJson(warehouseData)).toList();
      return warehouses;
    } else {
      throw Exception('Failed to fetch warehouses');
    }
  }
}
