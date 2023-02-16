import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../Controller/login_controller.dart';
import 'Mes_Widgets/input.dart';
import 'Mes_Widgets/submit.dart';


class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({super.key});

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {

  // Initialisation du controller ;
  LoginController loginController = Get.put(LoginController());

  final _formKey = GlobalKey<FormState>();



  @override

  void dispose(){
    loginController.passwordController.dispose();
    loginController.urlController.dispose();
    loginController.loginController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body : Container(
       // color: Colors.white,
       padding: EdgeInsets.only(top: 40),
        width: size.width,
        height: size.height,
       //decoration: BoxDecoration(
        

          // gradient: LinearGradient(
          //   begin:Alignment.topCenter,
          //   colors: [Colors.white,Colors.white, Colors.white,Colors.white,Color.fromRGBO(90, 158, 218, 1)],
          //   end: Alignment.bottomCenter,
          // ),  
        //),
        child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    //padding: EdgeInsets.only(left:20, right:20,bottom:0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromRGBO(28, 123, 206, 1),
                      border: Border.all(color: Color.fromRGBO(28, 123, 206, 1))
                      
                    ),
                   // height: loginController.isExented ? size.height / 1.8: size.height / 2.1,
                   height: size.height / 2.3,
                    width: size.width / 1.1,
                    child: SingleChildScrollView(
                      child: Center(
                        child:  Column(
                        
                    //  mainAxisAlignment: Main,
                      children: [
                       Form(
                        key: _formKey,
                        child: Container(
                         //height: isExented ? size.height / 2.3 : 0,
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
                              //(loginController.isExented) 
                              SubmitButton(
                                title : 'Se Connecter',
                                onPressed:()
                                {
                                   if (_formKey.currentState!.validate()) {
                                    //  setState(() {
                                    //     loginController.isLoading = true;
                                    //   });
                                    // (!loginController.isLoading) 
                                     
                                    loginController.loginWithLoginPassword();

                                  }
                                }
                                
                              )
                               //Container(),

                            ],
                          ),
                        ),
                       ),

                      ],
                    ),
                    ),
                    )
                  ),
                  Text('Salut')
                ],
              ),
              
            ),
        ),

      )
    );
  }

}