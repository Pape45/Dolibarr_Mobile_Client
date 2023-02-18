import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/login_controller.dart';


class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const SubmitButton({required this.title,required this.onPressed});

  

  @override
  Widget build(BuildContext context) {


    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top:15,left: 10,right: 10),

     // width: size.width / 1.1,
      height:  size.height / 16,

      child:  TextButton(
        
        style: ButtonStyle(
          backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
          shape:  MaterialStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
          ),
          )
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(title,
            style: TextStyle(
                color: Color.fromRGBO(28, 123, 206, 1),
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
          )
        ),
    );
  }
}