import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  int questuionIndex;
  final Function answerQuestion;
  Quiz(@required this.questions, @required this.questuionIndex,
      @required this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questuionIndex]['questionText']),
        ...(questions[questuionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
