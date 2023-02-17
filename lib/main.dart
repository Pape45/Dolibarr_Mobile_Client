import 'package:flutter/material.dart';
import 'package:dolibarr_mobile_client/pages/warehouse_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dolibarr Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dolibarr Mobile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.blue,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WarehouseHome()),
                  );
                },
                child: const Center(
                  child: Text(
                    'Warehouse',
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Module 2',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Module 3',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
            Container(
              width: 200.0,
              height: 200.0,
              color: Colors.orange,
              child: const Center(
                child: Text(
                  'Module 4',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
