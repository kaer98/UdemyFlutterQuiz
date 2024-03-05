import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? screenWidget;
  List<String> selectedanswers = [];
  var activeScreen = "start";

  void chooseAnswer(String answer) {
    selectedanswers.add(answer);
    if(selectedanswers.length == questions.length){
      switchScreen();
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "start";
      screenWidget = StartScreen(switchScreen);
      selectedanswers = [];
    });
  }

  void switchScreen() {
    setState(() {
      switch (activeScreen) {
        case "start":
          activeScreen = "questions";
          screenWidget = QuestionsScreen(chooseAnswer);
          break;
        case "questions":
          activeScreen = "results";
          screenWidget = ResultsScreen(selectedanswers, restartQuiz);
          break;
        case "results":
          activeScreen = "start";
          screenWidget = StartScreen(switchScreen);
          break;
      }
    });
  }

  @override
  void initState() {
    screenWidget = StartScreen(switchScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.purple, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screenWidget,
      ),
    ));
  }
}
