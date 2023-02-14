import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late String _message;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _loadMessage();
  }

  Future<void> _loadMessage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _message = prefs.getString('message') ?? widget.user.message;
      _messageController.text = _message;
    });
  }

  Future<void> _saveMessage(String message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('message', message);
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, This is your token : ${widget.user.token}'),
          ],
        ),
      ),
    );
  }
}
