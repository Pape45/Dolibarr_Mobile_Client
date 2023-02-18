import 'package:flutter/material.dart';
import 'package:dolibarr_mobile_client/API/warehouse_api.dart';

class WarehouseList extends StatelessWidget {
  const WarehouseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouses'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: WarehouseApi.getWarehouses(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Map<String, dynamic>> warehouses = snapshot.data!;
            return ListView.builder(
              itemCount: warehouses.length,
              itemBuilder: (context, index) {
                final warehouse = warehouses[index];
                return ListTile(
                  title: Text(warehouse['label']),
                  subtitle: Text(warehouse['town']),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle warehouse tap
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
