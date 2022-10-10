import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/cart/cart_tab_screen.dart';
import 'package:greengrocer/src/pages/home/home_tab_screen.dart';
import 'package:greengrocer/src/pages/orders/orders_screen.dart';
import 'package:greengrocer/src/pages/profile/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTabScreen(),
          CartTabScreen(),
          OrdersScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            // pageController.jumpToPage(currentIndex);
            pageController.animateToPage(
              index,
              duration: const Duration(
                milliseconds: 500,
              ),
              curve: Curves.ease, // and anothers animations
            );
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
