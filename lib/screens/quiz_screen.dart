import 'package:flutter/material.dart';
import '../models/question.dart';
import '../services/api_service.dart';
import '../widgets/animated_background.dart';
import '../widgets/option_button.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late Future<List<Question>> _questions;
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    _questions = ApiService().fetchQuestions();
  }

  void _answerQuestion(int selectedOptionId) {
    _questions.then((questions) {
      setState(() {
        if (selectedOptionId == questions[_currentQuestionIndex].correctAnswer) {
          _correctAnswers++;
        }
        if (_currentQuestionIndex < questions.length - 1) {
          _currentQuestionIndex++;
        } else {
          Navigator.pushReplacementNamed(context, '/result', arguments: _correctAnswers);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: FutureBuilder<List<Question>>(
            future: _questions,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No questions available', style: TextStyle(color: Colors.white)));
              } else {
                final question = snapshot.data![_currentQuestionIndex];
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Question ${_currentQuestionIndex + 1}/${snapshot.data!.length}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(height: 20),
                      Text(
                        question.question,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 40),
                      ...question.options.map((option) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: OptionButton(
                          text: option.text,
                          onPressed: () => _answerQuestion(option.id),
                          option: option, // Ensure to pass the Option object
                        ),
                      )),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
