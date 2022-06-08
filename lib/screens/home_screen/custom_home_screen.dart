import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../account/account.dart';
import '../cart/cart.dart';
import '../category/category.dart';
import '../stores/stores.dart';
import '/constants/constants.dart';
import 'home_screen.dart';

class CustomHomeScreen extends StatefulWidget {
  const CustomHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomHomeScreen> createState() => _CustomHomeScreenState();
}

class _CustomHomeScreenState extends State<CustomHomeScreen> {
  int currPage = 0;

  void changeRoute(index) => setState(() => currPage = index);

  List<Widget> pages = const <Widget>[
    HomeScreen(),
    Category(),
    StoreScreen(),
    CartScreen(),
    UserAccount()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: pages[currPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currPage,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: AppColors.grey,
          onTap: (index) => changeRoute(index),
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Stores"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ));
  }
}
