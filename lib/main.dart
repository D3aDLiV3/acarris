import 'package:acarreos/screens/home.dart';
import 'package:acarreos/screens/login.dart';
import 'package:acarreos/screens/maps.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      initialRoute: 'Login',
      routes: {
        'Login': (BuildContext context) => LoginScreen(),
        'Maps': (BuildContext context) => const MapScreen(),
        'Home': (BuildContext context) => const HomePageScreen(),
      },
    );
  }
}
