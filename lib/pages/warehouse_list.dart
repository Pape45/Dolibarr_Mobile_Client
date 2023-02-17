import 'package:dolibarr_mobile_client/api/warehouse_api.dart';
import 'package:dolibarr_mobile_client/model/warehouse.dart';
import 'package:flutter/material.dart';

class WarehouseList extends StatefulWidget {
  const WarehouseList({Key? key}) : super(key: key);

  @override
  WarehouseListState createState() => WarehouseListState();
}

class WarehouseListState extends State<WarehouseList> {
  late Future<List<Warehouse>> _futureWarehouses;

  @override
  void initState() {
    super.initState();
    _futureWarehouses = WarehouseApi.fetchWarehouses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouse List'),
      ),
      body: Center(
        child: FutureBuilder<List<Warehouse>>(
          future: _futureWarehouses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final warehouses = snapshot.data!;
              return ListView.builder(
                itemCount: warehouses.length,
                itemBuilder: (context, index) {
                  final warehouse = warehouses[index];
                  return ListTile(
                    title: Text(warehouse.label),
                    subtitle: Text(warehouse.description),
                    trailing: Text(warehouse.phone),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
