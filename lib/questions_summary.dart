import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summary, {super.key});

  List<Map<String, Object>> summary;

  ///nået til 84
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return Row(
             
             
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Text(
                    data["question_index"].toString() + ". ",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15 ,backgroundColor: Colors.black, color: Colors.white, ),
                    
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data["question"].toString()),
                      SizedBox(
                        height: 10,
                      ),
                      Text(data["answer"].toString(), style: TextStyle(color: data["answer"] == data["correct"] ? Colors.green : Colors.red)),
                      Text(data["correct"].toString(), style: TextStyle(color: Colors.green)),
                      Divider(),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
