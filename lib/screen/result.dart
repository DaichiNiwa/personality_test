import 'package:flutter/material.dart';
import 'dart:math';
import './main.dart';

class ResultPage extends StatelessWidget {
  static const String id = 'result_screen';
  final String title = '診断結果';
  String _resultTitle;
  String _resultBody;

  ResultPage() {
    final Map _result = Result().get();

    this._resultTitle = _result['title'];
    this._resultBody = _result['body'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '診断結果',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'あなたは$_resultTitleです。',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '$_resultBody',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Result {
  // TODO: このメソッドをコンストラクタにしたい
  Map get() {
    final _ramdomNumber = getRandomNumber();
    print(_ramdomNumber); // TODO: 消す
    return results[_ramdomNumber];
  }

  int getRandomNumber() {
    final _random = Random();
    return _random.nextInt(results.length);
  }
}

const List<Map<String, String>> results = [
  {
    'title': 'せっかち',
    'body': 'いつも急いでばかりいます。休憩も大事ですよ。',
  },
  {
    'title': 'あわてんぼう',
    'body': '毎日家の鍵を閉め忘れています。落ち着いて行動しましょう。',
  },
  {
    'title': 'おこりっぽい',
    'body': '1日平均10回は怒っています。広い心を持ちましょう。',
  },
  {
    'title': 'やさしい',
    'body': '慈愛に満ちていて、人の役に立つのが好きです。',
  },
];
