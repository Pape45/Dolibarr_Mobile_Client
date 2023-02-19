import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/login_controller.dart';

class InputTextField extends StatefulWidget {

   final TextEditingController textEditingController ;
  final String labelText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  bool isObscure = false;

  InputTextField(this.textEditingController, this.labelText, this.suffixIcon, this.isObscure, this.prefixIcon);



 

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {

  LoginController loginController = Get.find();
  bool voir = false;

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    if (widget.labelText.contains('mot de passe')){
      voir = true;
    }
    
    String controle;

    if(widget.labelText.contains('URL')){
      controle = 'URL';
    }
      else if (widget.labelText.contains('Login')){
        controle = 'Login';
      }
      else {
        controle = 'mot de passe';
    }
    

  
      return Container(
       // width: size,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      
     // padding: EdgeInsets.only(bottom: 5, top: 5),
      child: TextFormField(
        obscureText: voir,
        onChanged: (val){
          setState(() {
            loginController.isExented = true;
            
          });
        },
      validator: (value){
        if(value!.isEmpty ){
          setState(() {
            loginController.isExented = false;
            
          });
          return 'Svp vueillez entrer un $controle valide';
        }
      },
      controller: widget.textEditingController,
      decoration: InputDecoration(
        errorStyle: GoogleFonts.poppins(
          color:  Colors.white
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.labelText,

      
        labelStyle: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w400),
        prefixIcon: Icon(widget.prefixIcon, color: Color.fromRGBO(28, 123, 206, 1,),size: 23,),
       //suffixIcon: widget.isObscure ? Icon(widget.suffixIcon, color: Color.fromRGBO(28, 123, 206, 1,),size: 23,): null,

        suffixIcon:  widget.isObscure ? GestureDetector(
          onTap: (){
            setState(() {
              voir = ! voir;
            });
          },
          child:Icon(
            (voir)
              ? Icons.visibility
              : Icons.visibility_off,
               color: Color.fromRGBO(28, 123, 206, 1,),size: 23,

          ),
        ):null,


        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide (color:Color.fromRGBO(28, 123, 206, 1,), width: 1),

        ),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide (color:Color.fromRGBO(28, 123, 206, 1) ),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide (color:Color.fromRGBO(28, 123, 206, 1)),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide (color:Color.fromRGBO(28, 123, 206, 1)),

        ),
        ),
    )
    );
  }
}
