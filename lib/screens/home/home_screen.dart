import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/home/local_widgets/dashboard.dart';
import 'package:flutter_ecommerce/screens/home/local_widgets/profile.dart';
import 'package:flutter_ecommerce/screens/seller/product_sell.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selected_index = 0;
  void onItemTapped(int index) {
    setState(() {
      selected_index = index;
    });
    print("tapped item $selected_index");
  }

  static List<Widget> widgetOptions = <Widget>[
    DashBoard(),
    ProductSell(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
        body: widgetOptions.elementAt(selected_index),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: selected_index,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ));
  }
}
