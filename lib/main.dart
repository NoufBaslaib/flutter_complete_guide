import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questuionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questuionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questuionIndex = _questuionIndex + 1;
    });
    print(_questuionIndex);
  }

  //const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s your fav color?',
        'answer': [
          {'text': 'White', 'score': 1},
          {'text': 'Green', 'score': 2},
          {'text': 'Blue', 'score': 3},
          {'text': 'Black', 'score': 4}
        ]
      },
      {
        'questionText': 'What\'s your fav animal?',
        'answer': [
          {'text': 'Cat', 'score': 1},
          {'text': 'Kitty', 'score': 2},
          {'text': 'Bird', 'score': 3},
          {'text': 'Wolf', 'score': 4}
        ]
      },
      {
        'questionText': 'Who\'s your fav instructor?',
        'answer': [
          {'text': 'Nouf', 'score': 1},
          {'text': 'Nouf', 'score': 1},
          {'text': 'Nouf', 'score': 1},
          {'text': 'Nouf', 'score': 1}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Question('My first app'),
        ),
        body: _questuionIndex < _questions.length
            ? Quiz(_questions, _questuionIndex, _answerQuestion)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
