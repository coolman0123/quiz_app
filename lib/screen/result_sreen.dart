import 'package:flutter/material.dart';
import 'package:frontend/model/model_quiz.dart';
import 'package:frontend/screen/home_screen.dart';

class ResultSreen extends StatelessWidget {
  List<int> answers;
  List<Quiz> quizs;
  ResultSreen({super.key, required this.answers, required this.quizs});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for (int i = 0; i < quizs.length; i++) {
      if (quizs[i].answer == answers[i]) {
        score += 1;
      }
    }

    // ignore: deprecated_member_use
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'my quiz app',
          ),
          backgroundColor: Colors.blue[200],
          leading: Container(),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              border: Border.all(
                color: Colors.blue,
              ),
              color: Colors.blue[200],
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: width * 0.048),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    border: Border.all(color: Colors.blue),
                    color: Colors.white,
                  ),
                  width: width * 0.73,
                  height: height * 0.25,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          width * 0.048,
                          0,
                          width * 0.012,
                        ),
                        child: Text(
                          '수고하셨습니다',
                          style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '당신의 점수는',
                        style: TextStyle(
                          fontSize: width * 0.048,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        '$score/${quizs.length}',
                        style: TextStyle(
                            fontSize: width * 0.11,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          width * 0.012,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: width * 0.048,
                  ),
                  child: ButtonTheme(
                    minWidth: width * 0.73,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      },
                      child: const Text('홈으로 돌아가기'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
