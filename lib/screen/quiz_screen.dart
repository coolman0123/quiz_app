import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:frontend/model/model_quiz.dart';
import 'package:frontend/widget/widget_candidate.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz>? quizs;
  QuizScreen({super.key, this.quizs});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<int> _answer = [-1, -1, -1];
  List<bool> _answerState = [false, false, false, false];
  int _currentIndex = 0;
  final SwiperController _controller = SwiperController();

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
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue),
            ),
            width: width * 0.85,
            height: height * 0.85,
            child: widget.quizs == null || widget.quizs!.isEmpty
                ? const Center(child: Text('No quizzes available'))
                : Swiper(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    loop: false,
                    itemCount: widget.quizs!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buidQuizCard(widget.quizs![index], width, height);
                    },
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buidQuizCard(Quiz quiz, double width, double height) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(20),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
            child: Text(
              'Q${_currentIndex + 1}.',
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: width * 0.8,
            height: width * 0.1,
            padding: EdgeInsets.only(top: width * 0.012),
            child: AutoSizeText(
              quiz.title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: width * 0.048,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: _buildCandidates(
              width,
              quiz,
            ),
          ),
          Container(
            padding: EdgeInsets.all(width * 0.024),
            child: Center(
              child: ButtonTheme(
                minWidth: width * 0.5,
                height: height * 0.05,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                  onPressed: _answer[_currentIndex] == -1
                      ? null
                      : () {
                          if (_currentIndex == widget.quizs!.length - 1) {
                          } else {
                            _answerState = [false, false, false, false];
                            _currentIndex += 1;
                            _controller.next();
                          }
                        },
                  child: _currentIndex == widget.quizs!.length - 1
                      ? const Text('결과보기')
                      : const Text('다음문제'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCandidates(double width, Quiz quiz) {
    List<Widget> children = [];
    int candidateCount = quiz.candidates.length;

    for (int i = 0; i < candidateCount; i++) {
      children.add(
        CandWidget(
          tap: () {
            setState(() {
              for (int j = 0; j < candidateCount; j++) {
                if (j == i) {
                  _answerState[i] = true;
                  _answer[_currentIndex] = j;
                  print(_answer[_currentIndex]);
                } else {
                  _answerState[j] = false;
                }
              }
            });
          },
          answerState: i < _answerState.length ? _answerState[i] : false,
          index: i,
          text: quiz.candidates[i],
          width: width,
        ),
      );

      // Padding widget을 추가합니다.
      children.add(Padding(padding: EdgeInsets.all(width * 0.024)));
    }

    return children;
  }
}
