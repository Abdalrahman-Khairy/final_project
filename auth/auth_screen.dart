import 'package:flutter/material.dart';

import '../pages/login_screen.dart';
import '../pages/register_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showRegisterScreen: toggleScreen);
    } else {
      return RegisterScreen(showLoginScreen: toggleScreen);
    }
  }
}
