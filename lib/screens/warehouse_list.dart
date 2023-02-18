import 'package:flutter/material.dart';
import 'package:dolibarr_mobile_client/API/warehouse_api.dart';
import '../Models/warehouse.dart';
import 'warehouse_detail.dart';

class WarehouseList extends StatefulWidget {
  const WarehouseList({Key? key}) : super(key: key);

  @override
  WarehouseListState createState() => WarehouseListState();
}

class WarehouseListState extends State<WarehouseList> {
  late Future<List<Warehouse>> futureWarehouses;

  @override
  void initState() {
    super.initState();
    futureWarehouses = WarehouseApi.getWarehouses().then((warehousesJson) => warehousesJson
        .map((warehouseJson) => Warehouse.fromJson(warehouseJson))
        .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warehouse List'),
      ),
      body: Center(
        child: FutureBuilder<List<Warehouse>>(
          future: futureWarehouses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final warehouses = snapshot.data!;
              return ListView.builder(
                itemCount: warehouses.length,
                itemBuilder: (context, index) {
                  final warehouse = warehouses[index];
                  return ListTile(
                    title: Text(warehouse.label ?? ''),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WarehouseDetail(warehouse: warehouse)),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
