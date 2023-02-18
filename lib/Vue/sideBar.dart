import 'package:dolibarr_mobile_client/Models/point_entree_api.dart';
import 'package:dolibarr_mobile_client/Vue/authentification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/login_controller.dart';


class SideBar extends StatelessWidget {
   SideBar({ Key? key, }) : super(key: key);

  LoginController loginController = Get.find();



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Drawer(
      width:size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: size.height / 6,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
                child: Image.asset(
              "lib/Images/doli-removebg-preview.png",
            )),
          ),
          DrawerListTile(
            icon: Icons.production_quantity_limits_sharp,
            title: "Produits",
            onTap: () {},
          ),
          DrawerListTile(
            icon: Icons.group_sharp,
            title: "Tiers",
            onTap: () {},
          ),
          DrawerListTile(
            icon: Icons.house_siding_outlined,
            title: "Entrepots",
            onTap: () {},
          ),
          DrawerListTile(
            icon: Icons.home_repair_service_outlined,
            title: "Services",
            onTap: () {},
          ),
          DrawerListTile(
            icon: Icons.settings,
            title: "Settings",
            onTap: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: size.height / 3,
            //color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Container(
            height: size.height / 16,
            margin: const EdgeInsets.all(20),
            //padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15)),
            child: TextButton(
              onPressed: (){

                loginController.storage.delete(key: 'token');

                Get.to( const AuthentificationScreen());



              },
                  child: Text('Se deconnecter', style: TextStyle(color: Colors.white  , fontSize: 20),), )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontSize: 18),
      ),
    );
  }
}
