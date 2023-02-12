import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/login_controller.dart';


class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {

  // Initialisation du controller ;
  LoginController loginController = Get.put(LoginController());



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
   

    
    return Scaffold(
      body : SingleChildScrollView(
        child:,
      )
    );
  }

}