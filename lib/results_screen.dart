import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';


class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.choosenAnswers,this.restartQuiz, {super.key});
final void Function() restartQuiz;
  List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];
    for(int i =0; i < choosenAnswers.length; i++){
      summary.add({
        "question_index": i+1,
        "question": questions[i].text,
        "answer": choosenAnswers[i],
        "correct": questions[i].answers[0]});
    }
    
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    final numTotalQuestions = questions.length;
    var numCorrectAnswers = summarydata.where((data) {return data["answer"] == data["correct"];}).toList().length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have answered $numCorrectAnswers out of $numTotalQuestions questions correctly!"),
            const SizedBox(
              height: 20,
            ),
            QuestionSummary(summarydata),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: restartQuiz,
              child: Text("Restart Quiz"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
