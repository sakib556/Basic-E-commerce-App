import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/home_screen_controller.dart';
import 'package:flutter_ecommerce/screens/home/local_widgets/dashboard/dashboard.dart';
import 'package:flutter_ecommerce/screens/home/local_widgets/profile/profile.dart';
import 'package:flutter_ecommerce/screens/login/login_screen.dart';
import 'package:get/get.dart';

import 'local_widgets/seller/product_sell.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static List<Widget> widgetOptions = <Widget>[
    DashBoard(),
    const ProductSell(),
    Profile()
  ];
  final HomeScreenController _homeScreenController =
      Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(
            Icons.arrow_back_ios,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {},
            ),
            FloatingActionButton(
              onPressed: () async {
                await firebaseAuth.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: const Icon(Icons.logout),
            )
          ],
        ),
        body: Obx(() {
          return widgetOptions
              .elementAt(_homeScreenController.selected_index.value);
        }),
        bottomNavigationBar: Obx(() {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
            currentIndex: _homeScreenController.selected_index.value,
            selectedItemColor: Colors.amber[800],
            onTap: _homeScreenController.onItemTapped,
          );
        }));
  }
}
