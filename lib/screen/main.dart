import 'package:flutter/material.dart';
import 'dart:async';

import "./result.dart";
import "./question.dart";

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
      home: MyHomePage(title: 'ホーム'),
      routes: {
        QuestionPage.id: (context) => QuestionPage(),
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
              '性格診断',
            ),
            ElevatedButton(
              child: const Text('診断開始'),
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, QuestionPage.id);
              },
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
