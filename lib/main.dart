import 'package:flutter/material.dart';
import 'question.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Widget> scoreKeeper=[

  ];
 //  List <String> questions=[
 // 'You can lead a cow stairs but not up stairs.',
 //  'Approximately one quarter of human bones are in the feet.',
 //  'a slug\'s blood is green.',
 //  'A hippopotamus sweats red when stressed.',
 //  'India is 6th largest economy of the world.',
 //  'elephant is the largest mammal.',
 //  ];
 //
 //  List <bool> answers=[
 //    false,
 //    true,
 //    true,
 //    true,
 //    false,
 //    false
 //  ];

  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer= quizBrain.getCorrectAnswer();
    setState(() {
        if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();


        quizBrain.reset();


        scoreKeeper = [];
      }


      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  Question q1=Question('You can lead a cow stairs but not up stairs.',  false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child:Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                //foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 20.0,
                )
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
               checkAnswer(true);

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet., true,
question3: 'a slug\'s blood is green.', true ,
question4: 'A hippopotamus sweats red when stressed.', true,
question5: 'India is 6th largest economy of the world.',false,
question6: 'elephant is the largest mammal.',false.

 */