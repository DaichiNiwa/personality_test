import 'package:flutter/material.dart';
import 'dart:async';

import "./result.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: '性格診断'),
      routes: {
        ResultPage.id: (context) => ResultPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static int _questionSeconds = 5;
  int _questionNumber = 0;
  int _currentSeconds = _questionSeconds;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _nextQuestion() {
    _incrementCounter();

    if (_questionNumber >= questions.length) {
      _endQuestions();
    } else {
      _startTimer();
    }
  }

  void _incrementCounter() {
    setState(() {
      _questionNumber++;
    });
  }

  void _endQuestions() {
    _questionNumber = 0; // 不要かもしれないので一旦コメントアウト
    Navigator.pushNamed(context, ResultPage.id);
    super.dispose();
  }

  void _startTimer() {
    _currentSeconds = _questionSeconds;
    Timer.periodic(
      Duration(seconds: 1), // 1秒ごとに処理
      (_timer) => setState(
        () {
          if (_currentSeconds < 2) { // 本当は1に設定すべきだが、0が画面に表示されてしまうので2にしている
            _timer.cancel();
            _nextQuestion();
          } else {
            _currentSeconds = _currentSeconds - 1; // 1秒ずつデクリメント
          }
        },
      ),
    );
  }

  void _resetTimer() {
    _currentSeconds = _questionSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_currentSeconds',
            ),
            Text(
              questions[_questionNumber],
            ),
            ElevatedButton(
              child: const Text('はい'),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _nextQuestion,
            ),
            OutlinedButton(
              child: const Text('いいえ'),
              style: OutlinedButton.styleFrom(
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: _nextQuestion,
            ),
          ],
        ),
      ),
    );
  }
}

const List questions = [
  '頼み事をされると断れないことが多い。',
  '腕時計はできるだけ高い方がいい。',
  '天ぷらを揚げている時に忘れて外出したことがある。',
  '今までの人生で一度も嘘をついたことがない。',
];
