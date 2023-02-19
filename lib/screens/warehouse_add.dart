import 'package:flutter/material.dart';
import 'package:dolibarr_mobile_client/API/warehouse_api.dart';

class WarehouseAddPage extends StatefulWidget {
  const WarehouseAddPage({Key? key}) : super(key: key);

  @override
  WarehouseAddPageState createState() => WarehouseAddPageState();
}

class WarehouseAddPageState extends State<WarehouseAddPage> {

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String _label = '';
  String _description = '';
  String _status = '';
  String _address = '';
  String _zip = '';
  String _town = '';
  String _phone = '';
  String _fax = '';
  String _country = '';

  void _addWarehouse() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await WarehouseApi().addWarehouse(
          label: _label,
          description: _description,
          status: _status,
          address: _address,
          zip: _zip,
          town: _town,
          phone: _phone,
          fax: _fax,
          country: _country,
        );
        Navigator.pop(context, true);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(e.toString()),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Warehouse'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Label'),
                  onChanged: (value) {
                    setState(() {
                      _label = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a label';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Status'),
                  onChanged: (value) {
                    setState(() {
                      _status = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Address'),
                  onChanged: (value) {
                    setState(() {
                      _address = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Zip'),
                  onChanged: (value) {
                    setState(() {
                      _zip = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Town'),
                  onChanged: (value) {
                    setState(() {
                      _town = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a town';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone'),
                  onChanged: (value) {
                    setState(() {
                      _phone = value;
                    });
                  },
                ),
                TextFormField(
                    decoration: const InputDecoration(labelText: 'Fax'),
                    onChanged: (value) {
                      setState(() {
                        _fax = value;
                      });
                    }),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Country'),
                  onChanged: (value) {
                    setState(() {
                      _country = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a country';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _addWarehouse,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
