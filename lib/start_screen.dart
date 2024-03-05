import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
const StartScreen(this.startQuiz,{super.key});

final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset("assets/images/quiz-logo.png",
                      width: 300, color: const Color.fromARGB(200, 255, 255, 255),
                      ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: startQuiz,
                  label: const Text(
                    "Start Quiz",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  icon: const Icon(Icons.play_arrow, color: Colors.white),
                ),
              ],
            ),
    );
       
  }
}
