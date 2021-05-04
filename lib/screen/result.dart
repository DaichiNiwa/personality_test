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
    'body': 'あなたはいつも家の鍵を閉め忘れています。',
  },
  {
    'title': 'おこりっぽい',
    'body': 'あなたは1日4回は怒っています。',
  },
  {
    'title': 'やさしい',
    'body': 'あなたは慈愛に満ちています。',
  },
];
