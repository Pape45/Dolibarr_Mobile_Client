import 'package:dolibarr_mobile_client/Vue/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/login_controller.dart';
import 'Vue/authentification_screen.dart';
import 'Vue/loading.dart';
import 'Vue/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  
    LoginController loginController = Get.put(LoginController());
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

       
        primarySwatch: Colors.blue,
      ),
       home: Welcome(),
    );
  }
}

