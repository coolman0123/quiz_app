import 'package:flutter/material.dart';
import 'package:frontend/model/model_quiz.dart';
import 'package:frontend/screen/quiz_screen.dart';

//mediaquery를 활용한 반응형 UI 앱
//mediaquery는 기기의 상태 정보를 알 수 있음(화면의 사이즈, 화면 로테이션 정보)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap(
      {
        'title': 'test',
        'candidates': ['a', 'b', 'c'],
        'answer': 0
      },
    ),
    Quiz.fromMap(
      {
        'title': 'test',
        'candidates': ['a', 'b', 'c'],
        'answer': 0
      },
    ),
    Quiz.fromMap(
      {
        'title': 'test',
        'candidates': ['a', 'b', 'c'],
        'answer': 0
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    //safeArea는 기기의 상단 노티 바 부분, 하단 영역을 침범하지 않는 안전한 영역을 잡아줌
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CSW QUIZ APP'),
          backgroundColor: Colors.blue[200],
          leading: Container(), //일부러 빈 컨테이너 넣어줌, 페이지 이동시 자동으로 생겨나는 뒤로가기 버튼 지워줌
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'images/quiz.jpg',
                width: width * 0.8,
                height: height * 0.2,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              "퀴즈 앱",
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '퀴즈를 풀기 전 안내사항입니다. \n 꼼꼼히 읽고 퀴즈 풀기를 눌러주세여.',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _buildStep(width, '1. 랜던으로 나오는 퀴즈 3개를 풀어보세요.'),
            _buildStep(width, '2. 문제를 잘 읽고 정답을 고른 뒤\n 다음 문제 버튼을 눌러주세요.'),
            _buildStep(width, '3. 만점을 향해 화이팅.'),
            Padding(
              padding: EdgeInsets.all(
                width * 0.048,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: width * 0.036,
              ),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue[300],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            quizs: quizs,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      '지금 퀴즈 풀기',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048,
        width * 0.024,
        width * 0.048,
        width * 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(
              right: width * 0.024,
            ),
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
