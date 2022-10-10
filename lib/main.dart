import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((_) {
  //   runApp(const MyApp());
  // });
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green Grocery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen()//SignInScreen(),
    );
  }
}
