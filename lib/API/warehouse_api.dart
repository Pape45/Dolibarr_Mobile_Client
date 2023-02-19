import 'dart:convert';
import 'package:dolibarr_mobile_client/Controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WarehouseApi {


  static String apiUrl = 'http://10.106.98.100/api/index.php';

  //static final String apiKey = '' ;
  

  //const WarehouseApi();

  LoginController loginController = Get.find();


  Future<List<Map<String, dynamic>>> getWarehouses() async {
    final response = await http.get(

        Uri.parse('http://10.106.98.100/api/index.php/warehouses?sortfield=t.rowid&sortorder=ASC&limit=100'),
        headers: {'DOLAPIKEY':'${loginController.valeurStockee}'});

    if (response.statusCode == 200) {
      final List<dynamic> warehousesJson = json.decode(response.body);
      return warehousesJson.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load warehouses');
    }
  }

  Future<void> addWarehouse({

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
          'DOLAPIKEY': '${loginController.valeurStockee}',
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

  Future<void> deleteWarehouse(int warehouseId) async {
    final response = await http.delete(
        Uri.parse('$apiUrl/warehouses/$warehouseId'),
        headers: {'DOLAPIKEY': '${loginController.valeurStockee}'});

    if (response.statusCode != 200) {
      throw Exception('Failed to delete warehouse');
    }
  }

  Future<void> updateWarehouse({
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
              'DOLAPIKEY': '${loginController.valeurStockee}',
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
