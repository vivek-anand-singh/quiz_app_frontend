import 'package:flutter/material.dart';
import '../widgets/animated_background.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz App',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                child: Text('Start Quiz'),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/quiz');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}