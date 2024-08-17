import 'package:flutter/material.dart';
import 'screens/start_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(),
        '/quiz': (context) => QuizScreen(),
        '/result': (context) => ResultScreen(),
      },
    );
  }
}