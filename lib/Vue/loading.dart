import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/login_controller.dart';
import 'authentification_screen.dart';
import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}


class _LoadingScreenState extends State<LoadingScreen> {


  LoginController loginController = Get.find();


  bool? keyExists ;

  @override
  initState () {
    super.initState();
    Verification();

  }

  void  Verification() async {
    await loginController.storage.containsKey(key: 'token').then((value){
      if(value){
        Get.to(HomePage());
      }
      else {
        Get.to(AuthentificationScreen());
      }
      
    });

  }
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),

    );
  }
}