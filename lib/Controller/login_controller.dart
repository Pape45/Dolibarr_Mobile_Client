import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Models/point_entree_api.dart';


class LoginController extends GetxController {

  // Definition des controlleurs pour la saisie
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController urlController = TextEditingController();


  @override
  void dispose(){
    loginController.dispose();
    urlController.dispose();
    passwordController.dispose();
  }

  // Definition de la methode pour se connecter

   Future<void> loginWithEmail() async {

    // Definition de l'entete
   
    var headers = {'Content-type' : 'application/json'};

    try {

      // Url pour la connection
      var url = Uri.parse(PointEntree.urlDeBase  + PointEntree.authPoint.login);

      Map body = {
        'login' : loginController.text,
        'password' : passwordController.text

      };

      http.Response reponse = await http.post(url,headers:headers,body:jsonEncode(body));
      
      if(reponse.statusCode == 200){
        final json = jsonDecode(reponse.body);


          loginController.clear();
          passwordController.clear();
          urlController.clear();

          // Go to home // Page  d'accueil
          Get.off(null);
 
      }
      else {
        throw jsonDecode(reponse.body)['message'] ?? 'Erreur inconnue';
      }

    } catch (e) {
      Get.back();
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
         builder: (context){
          return SimpleDialog(
            title:Text ('Error'),
            contentPadding: EdgeInsets.all(20),
            children: [
              Text(e.toString()),
            ],
          );
         }
      );
    }

  }

}