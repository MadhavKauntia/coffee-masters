import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/pages/menupage.dart';
import 'package:coffee_masters/pages/offerspage.dart';
import 'package:coffee_masters/pages/orderpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dataManager = DataManager();
  var selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("!!!!");

    switch(selectedIndex) {
      case 0: currentWidgetPage = MenuPage(dataManager: dataManager);
          break;
      case 1: currentWidgetPage = const OffersPage();
          break;
      case 2: currentWidgetPage = OrderPage(dataManager: dataManager);
          break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/logo.png"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.brown.shade50,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: "Offers"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_outlined), label: "Order")
        ],
      ),
      body: currentWidgetPage,
    );
  }
}
