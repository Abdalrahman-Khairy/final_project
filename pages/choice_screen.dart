import 'package:flutter/material.dart';

class ChoiceScreen extends StatelessWidget {
  final String situation;
  final String question;
  final String optionA;
  final String optionB;
  final String optionC;

  const ChoiceScreen({
    super.key,
    required this.situation,
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
  });

  Future award() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(situation),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ChoiceCard(choice: optionA),
          const SizedBox(height: 10),
          ChoiceCard(choice: optionB),
          const SizedBox(height: 10),
          ChoiceCard(choice: optionC),
        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final String choice;

  const ChoiceCard({super.key, required this.choice});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          showAutoCloseDialog(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              choice,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void showAutoCloseDialog(BuildContext context, {int durationSeconds = 3}) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        // Automatically close the dialog after the specified duration
        Future.delayed(Duration(seconds: durationSeconds), () {
          Navigator.of(context).pop(); // This closes the dialog
        });

        // Return the Dialog widget
        return AlertDialog(
          title: Text(
            'You Win..',
          ),
          icon: Icon(
            Icons.star_border,
            color: Colors.orangeAccent,
          ),
        );
      },
    );
  }
}
