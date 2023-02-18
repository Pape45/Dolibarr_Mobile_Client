
import 'package:dolibarr_mobile_client/Vue/Mes_Widgets/module.dart';
import 'package:dolibarr_mobile_client/Vue/sideBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text (
          'Daalal ak Diam ',
          style: GoogleFonts.poppins(
            color: Color.fromRGBO(28, 123, 206, 1),
            fontSize: 23
          )

        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:  Color.fromRGBO(28, 123, 206, 1), size: 28),
      ),
      drawer:  SideBar(),
      body: SingleChildScrollView(
       // physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
             Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Mes modules',
                style: GoogleFonts.poppins(
                   fontSize: 26,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(28, 123, 206, 1)
                ),
              ),
             ),
              const Modules(imageBack: 'lib/Images/box1.png', title: 'Produits', nombre: 10, color: Colors.white, ColorIcon: Colors.white, icon:Icons.abc,iconImage: 'lib/Images/produit.png' ),
              const Modules(imageBack: 'lib/Images/fondd.jpg', title: 'Prospect', nombre: 20, color: Color.fromRGBO(28, 123, 206, 1), ColorIcon: Colors.white, icon:Icons.abc,iconImage: 'lib/Images/iconTiers.png'),
              const Modules(imageBack: 'lib/Images/box1.png', title: 'Entrepot', nombre: 20, color: Colors.white, ColorIcon: Colors.white, icon:Icons.abc,iconImage: 'lib/Images/weee.png'),
              const Modules(imageBack: 'lib/Images/fondd.jpg', title: 'Services', nombre: 20, color: Color.fromRGBO(28, 123, 206, 1), ColorIcon: Colors.white, icon:Icons.abc,iconImage: 'lib/Images/servicv1.png'),
            ],
          ),
        ),
      ),
    );
  }
}
