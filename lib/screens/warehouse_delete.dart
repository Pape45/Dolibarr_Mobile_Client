import 'package:flutter/material.dart';
import 'package:dolibarr_mobile_client/API/warehouse_api.dart';

class WarehouseDeleteApi extends StatefulWidget {
  const WarehouseDeleteApi({Key? key}) : super(key: key);

  @override
  _WarehouseDeleteApiState createState() => _WarehouseDeleteApiState();
}

class _WarehouseDeleteApiState extends State<WarehouseDeleteApi> {
  final _formKey = GlobalKey<FormState>();
  int? _warehouseId;
  bool _isDeleting = false;

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment supprimer cet entrepôt ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _isDeleting = true;
      });

      try {
        await WarehouseApi.deleteWarehouse(_warehouseId!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Entrepôt supprimé')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Erreur lors de la suppression')),
        );
      } finally {
        setState(() {
          _isDeleting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supprimer un entrepôt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ID de l\'entrepôt',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir l\'ID de l\'entrepôt';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Veuillez saisir un nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _warehouseId = int.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _confirmDelete(context);
                  }
                },
                child: const Text('Supprimer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
