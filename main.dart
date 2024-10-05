
import 'package:final_project/pages/home_screen.dart';
import 'package:final_project/pages/league_screen.dart';
import 'package:final_project/pages/profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/auth_screen.dart';
import 'auth/main_page.dart';
import 'firebase_options.dart';
// import 'package:rive_animation/screens/onboding/onboding_screen.dart';


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
    return  MaterialApp(
      home: const MainPage(),
      routes: {
        '/login_screen':(context)=> const AuthScreen(),
        '/home_screen':(context)=> const HomeScreen(),
        '/profile_screen':(context)=> const ProfileScreen(),
        '/league_screen': (context) => const LeagueScreen(),

      },
      // MainPage()
    );
  }
}

class Carpon extends StatelessWidget {
  const Carpon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
