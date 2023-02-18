import 'package:dolibarr_mobile_client/Vue/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/login_controller.dart';
import 'Vue/authentification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  
    LoginController loginController = Get.put(LoginController());
    bool  directementHome = false;

    // Verfication 
    Future<void> Verification() async {
      bool keyExists = await loginController.storage.containsKey(key:'token');
      if (keyExists){
        print('La cle existe');
        directementHome = true;
      }
      else 
        directementHome = false;
    }

    Verification();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

       
        primarySwatch: Colors.blue,
      ),
       home:  (!directementHome) ? HomePage() : AuthentificationScreen() ,
      // home:  AuthentificationScreen(),
    );
  }
}

