import 'package:flutter/material.dart';
import '../Models/warehouse.dart';

class WarehouseDetail extends StatelessWidget {
  final Warehouse warehouse;

  const WarehouseDetail({Key? key, required this.warehouse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(warehouse.label ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${warehouse.id ?? ''}'),
            const SizedBox(height: 8),
            Text('Description: ${warehouse.description ?? ''}'),
            const SizedBox(height: 8),
            Text('Status: ${warehouse.status ?? ''}'),
            const SizedBox(height: 8),
            Text('Address: ${warehouse.address ?? ''}'),
            const SizedBox(height: 8),
            Text('Zip: ${warehouse.zip ?? ''}'),
            const SizedBox(height: 8),
            Text('Town: ${warehouse.town ?? ''}'),
            const SizedBox(height: 8),
            Text('Phone: ${warehouse.phone ?? ''}'),
            const SizedBox(height: 8),
            Text('Fax: ${warehouse.fax ?? ''}'),
            const SizedBox(height: 8),
            Text('Country ID: ${warehouse.countryId ?? ''}'),
          ],
        ),
      ),
    );
  }
}
