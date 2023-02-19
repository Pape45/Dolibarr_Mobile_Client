import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/login_controller.dart';
import 'Mes_Widgets/input.dart';
import 'Mes_Widgets/submit.dart';


class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  void initState(){


  }

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {

  // Initialisation du controller ;
 // LoginController loginController = Get.find(LoginController());
  LoginController loginController = Get.find();


  final _formKey = GlobalKey<FormState>();



 

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body : Container(
        color: Colors.white,
       padding: EdgeInsets.only(top: 40),
        width: size.width,
        height: size.height,

        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  // Image Logo Dolibarr
                  Image.asset(
                    "lib/Images/1.jpg",
                    fit:BoxFit.cover,
                    height: size.height / 4,
                    width: size.width / 1.8,
                  ),

                  //  Container qui du formulaire

                  Container(
                    margin: EdgeInsets.only(top: 30),
                    //padding: EdgeInsets.only(left:20, right:20,bottom:0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromRGBO(28, 123, 206, 1),
                      border: Border.all(color: Color.fromRGBO(28, 123, 206, 1))
                      
                    ),
                   height: size.height / 2.3,
                    width: size.width / 1.1,
                    child: SingleChildScrollView(
                      child: Center(
                        child:  Column(
                        
                      children: [
                       Form(
                        key: _formKey,
                        child: Container(
                          width: size.width / 1.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: size.height/ 14,
                                margin: EdgeInsets.only(bottom: 30),
                                decoration:BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                                  


                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.lock_open
                                      ),
                                    ),
                                    Expanded(
                                      child: Center (
                                        child: Text(
                                          'Authentification',
                                          style: GoogleFonts.poppins(color:Color.fromRGBO(28, 123, 206, 1),fontSize: 20, fontWeight: FontWeight.bold ),
                                          )
                                        ),
                                    )
                                  

                                  ],
                                ),
                              ),
                           
                              InputTextField(loginController.loginController, 'Mettez ici le Login', Icons.person, false, Icons.person),
                              InputTextField(loginController.passwordController, 'Mettez ici le Password', Icons.visibility, true, Icons.lock_rounded),
                              SubmitButton(
                                title : 'Se Connecter',
                                onPressed:()
                                {
                                   if (_formKey.currentState!.validate()) {
                                
                                    loginController.loginWithLoginPassword();

                                  }
                                }
                                
                              )

                            ],
                          ),
                        ),
                       ),

                      ],
                    ),
                    ),
                    )
                  ),
                ],
              ),
              
            ),
        ),

      )
    );
  }

}