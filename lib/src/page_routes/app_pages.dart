import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/view/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/view/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/base/binding/navigation_binding.dart';
import 'package:greengrocer/src/pages/cart/binding/cart_binding.dart';
import 'package:greengrocer/src/pages/home/binding/home_binding.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SignInScreen(),
      name: PagesRoutes.signRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoutes.signUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseRoute,
      bindings: [
        NavigationBinding(),
        HomeBinding(),
        CartBinding(),
      ],
    ),
  ];
}

abstract class PagesRoutes {
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
  static const String signRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String getCategoryList = '/get-category-list';
  static const String getCartItems = '/get-cart-items';
  static const String addItemToCart = '/add-item-to-cart';
  static const String modifyItemQuantity = '/modify-item-quantity';
  static const String getProductList = '/get-product-list';
  static const String checkout = '/checkout';
  static const String getOrders = '/get-orders';
  static const String getOrderItems = '/get-order-items';
}
