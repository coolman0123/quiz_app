import 'package:flutter/material.dart';
import 'package:frontend/model/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz>? quizs;
  QuizScreen({super.key, this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<int> _answer = [-1, -1, -1];
  final List<bool> _answerState = [false, false, false, false];
  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.blue[200],
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20,
            ),
            border: Border.all(color: Colors.blue),
          ),
          width: width * 0.85,
          height: height * 0.85,
        ),
      ),
    ));
  }
}
