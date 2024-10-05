import 'package:flutter/material.dart';

class LeagueScreen extends StatelessWidget {
  const LeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('League'),
        backgroundColor: const Color.fromARGB(255, 68, 204, 0),
        elevation: 0,
      ),
    );
  }
}
