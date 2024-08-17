import 'package:flutter/material.dart';
import '../widgets/animated_background.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final correctAnswers = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: AnimatedBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Completed!',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: 20),
              Text(
                'You got $correctAnswers out of 10 questions correct!',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Start Quiz'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/quiz');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
