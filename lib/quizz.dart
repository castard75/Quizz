import 'package:flutter/material.dart';

final List<String> list_questions = [
  "Le piton des neiges est un volcan de la Réunion ?",
  "Flutter permet de faire des applications web également ?",
  "Php est le language utilisé par Flutter"
];
final List<bool> list_reponses = [true, false, false];

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  int currentQuestionIndex = 0;
  List<Icon> list_icon = [];

//function handleClick pour gérer la réponse
  handleClick(bool reponse) {
    setState(() {
      if (reponse == list_reponses[currentQuestionIndex]) {
        list_icon.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        list_icon.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      // Au click on passe à la quesiton suivante
      currentQuestionIndex++;

      if (currentQuestionIndex >= list_reponses.length) {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(list_questions[currentQuestionIndex],
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  handleClick(true);
                },
                child: Center(
                  child: Text("VRAI"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  handleClick(false);
                },
                child: Center(
                  child: Text("Faux"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: list_icon,
            ),
          ),
        ],
      ),
    );
  }
}
