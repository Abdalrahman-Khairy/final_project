import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'horizontal_slider.dart';
import 'my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 68, 204, 0),
        elevation: 4.0,
shadowColor: Colors.grey,
      ),
      drawer: const MyDrawer(),
      body: const SafeArea(child: HorizontalSlider(),),
    );
  }
}
