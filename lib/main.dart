import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/page_routes/app_pages.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Green Grocery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRoutes.splashRoute,
      getPages: AppPages.pages, // lista de páginas mapeadas
    );
  }
}
