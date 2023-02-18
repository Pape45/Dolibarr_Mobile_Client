import 'dart:convert';
import 'package:dolibarr_mobile_client/Vue/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/point_entree_api.dart';

class LoginController extends GetxController {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  bool isExented = false;
  bool isLoading = false;

  Future<void> loginWithLoginPassword() async {
    // Definition de l'entete

    var headers = {'Content-type': 'application/json'};

    try {
      // Url pour la connection
      var url = Uri.parse(PointEntree.urlDeBase + PointEntree.authPoint.login);

      Map body = {
        'login': loginController.text,
        'password': passwordController.text
      };

      http.Response reponse =
          await http.post(url, headers: headers, body: jsonEncode(body));

      if (reponse.statusCode == 200) {
        isLoading = false;
        final json = jsonDecode(reponse.body);

        loginController.clear();
        passwordController.clear();
        urlController.clear();
        print('Salut');

        // Go to home // Page  d'accueil
        Get.to(HomePage());
      } else if (reponse.statusCode == 403) {
        // isLoading = false;

        Get.snackbar(
          'Erreur sur l\'authentification',
          'Votre email ou mot de passe est incorrect',
          colorText: Color.fromRGBO(28, 123, 206, 1),
          icon: Icon(Icons.error_outline_sharp),

          // borderColor:  Color.fromRGBO(28, 123, 206, 1),
        );
      } else {
        throw jsonDecode(reponse.body)['message'] ?? 'Erreur inconnue';
      }
    } catch (e) {
      showDialog(
          barrierDismissible: false,
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text(e.toString()),
              ],
            );
          });
      Get.back();
    }
  }
}
