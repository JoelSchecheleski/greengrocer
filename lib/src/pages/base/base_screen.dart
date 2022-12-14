import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:greengrocer/src/pages/base/controller/navigation_controller.dart';
import 'package:greengrocer/src/pages/cart/view/cart_tab_screen.dart';
import 'package:greengrocer/src/pages/home/view/home_tab_screen.dart';
import 'package:greengrocer/src/pages/orders/view/orders_screen.dart';
import 'package:greengrocer/src/pages/profile/profile_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {

  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: navigationController.pageController,
        children: const [
          HomeTabScreen(),
          CartTabScreen(),
          OrdersScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: navigationController.currentIndex,
          onTap: (index) {
            navigationController.navigatePageView(index);
            // setState(() {
            //   currentIndex = index;
            //   pageController.animateToPage(
            //     index,
            //     duration: const Duration(
            //       milliseconds: 500,
            //     ),
            //     curve: Curves.ease, // and anothers animations
            //   );
            // });
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
        );
      }),
    );
  }
}
