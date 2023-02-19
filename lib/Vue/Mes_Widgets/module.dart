import 'dart:developer';

import 'package:dolibarr_mobile_client/Vue/services_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../warehouse_screen.dart';
import '../product_screen.dart';
import '../tiers_screen.dart';

class Modules extends StatelessWidget {

  final String? title;
  final int nombre;
  final Color color;
  final Color ColorIcon;
  final IconData icon;
  final String imageBack;
  final String  iconImage;


  const Modules({super.key, required this.imageBack, required this.title, required this.nombre, required this.color, required this.ColorIcon, required this.icon, required this.iconImage,});

  @override
  Widget build(BuildContext context) {
    bool coloor = false;

    if (title == "Services" || title == "Prospect") {
      coloor = true;
      
    }

    Widget?  pages ;

    if (title == "Services"){
      pages = ServiceScreen();
    } else if (title == "Prospect"){
      pages = TiersScreen();  
    } else if (title == "Produits"){
      pages = ProductScreen();
    }
    else {
      pages = WarehouseScreen();
    }


    var size = MediaQuery.of(context).size;
    return  Container(
      width: size.width,
      height: size.height / 5,
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 15, left: 20,right: 10,bottom: 20),
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Color.fromRGBO(28, 123, 206, 1)),
        image: DecorationImage(
          image: AssetImage(imageBack),
          
          fit: BoxFit.fill
        ),
       color: color,

       // si x6 augmente d'une unite le profit va dimunier d'e 100/3

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(padding: EdgeInsets.only(left: 0),
    child: Text(
      '$title',
      style:GoogleFonts.concertOne(
                  fontWeight: FontWeight.normal,
                  color: color,
                  fontSize: 35,

                ),
    ),
    ),
    
    Spacer(),
    Container(
      width: size.width /3,
      child: TextButton(
        onPressed: (){
          Get.to(pages);

        },
        child: Text('Consulter',
        style:  GoogleFonts.poppins(fontSize: 15,
        color: (coloor) ? Colors.white : Color.fromRGBO(28, 123, 206, 1)
        ),
      ),
      style: ButtonStyle(
        backgroundColor: (!coloor)   ?MaterialStateProperty.all<Color>(Colors.white) : MaterialStateProperty.all<Color>(Color.fromRGBO(28, 123, 206, 1)),
        shape:  MaterialStateProperty.all(
          RoundedRectangleBorder
          (
            borderRadius: BorderRadius.circular(7),
          ),
        )
      ), 

      )
            ),
          ],
        ),
        Image.asset(iconImage,
         width: size.width / 3.5,
        )

        ],
      )
    );
  }
}