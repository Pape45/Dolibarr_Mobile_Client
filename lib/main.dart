import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Example'),
        ),
      ),
    );
  }
}
