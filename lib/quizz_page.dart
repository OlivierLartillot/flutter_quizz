import 'package:flutter/material.dart';
import 'package:flutter_quizz/Datas.dart';
import 'package:flutter_quizz/Question.dart';

class QuizzPage extends StatefulWidget {
  @override
  QuizzPageState createState() => QuizzPageState();
  }


class QuizzPageState extends State<QuizzPage>{

  List<Question> questions = Datas().listeQuestions;
  int scoreCounter = 0;
  int index = 0;


  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    Question question = questions[index];

     return Scaffold(
       appBar: AppBar(
          title: Text("Score : $scoreCounter")
       ),
       body: Center(
         child: Card(
           color: Colors.deepOrange.shade100,
           elevation: 10,
           margin:const EdgeInsets.only(left: 20, right: 20),
           child: Column(
               mainAxisSize: MainAxisSize.min,
             children:[

               Padding(
                 padding: const EdgeInsets.all(8),
                 child: Column(
                   children: [
                     Text("Question ${index + 1}/ ${questions.length}"),
                     Text(question.getQuestion()),
                      Divider(thickness: 2, color: Colors.deepOrange,),
                      Image.asset(
                     '${questions[index].getImage()}',
                       height: height /2.5,
                       width: width/0.8,
                       fit: BoxFit.cover,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         answerBtn(false),
                         answerBtn(true),
                       ],
                     )





                   ],
                 )
               ),

             ]

           ),
         )

       ),
     );

  }

  ElevatedButton answerBtn(bool isTrue) {

    return ElevatedButton (
      onPressed: (() {
        setState(() {
          checkAnswer(isTrue);
        });
      }),
      style: ElevatedButton.styleFrom(
        elevation: 8,
        primary: (isTrue)? Colors.green : Colors.red,
      ),
      child: (isTrue)? Text("Vrai") : Text("Faux"),
    );

  }

  checkAnswer(bool answer) {

  final question = questions[index];

  bool goodAnswer = (question.reponse == answer);
      setState(() {
      if (goodAnswer) {
        setState(() {
          scoreCounter++;
        });

      }
      });

      showAnswer(goodAnswer);

  }

  Future <void> showAnswer(bool goodAnswer) {
    Question question = questions[index];
    String title = (goodAnswer) ? "Bien Joué " : "Mauvaise réponse";
    String imageToShow = (goodAnswer) ? "vrai.jpg" : "faux.jpg";
    String completePath = "images/$imageToShow";
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(title),
            children: [
              Image.asset(completePath),
              Text(question.explication),
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    toNextQuestion();

                  },
                  child: Text("Suivant"),
              )
            ]


          );
        }
    );
  }

  Future <void> showResult() async{
          return await showDialog(
            barrierDismissible: false,
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: Text("C'est Fini"),
                  content: Text("Votre score est de $scoreCounter"),
                actions: [
                  TextButton(
                      onPressed: (){
                        Navigator.of(ctx).pop();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Ok")),
                ],
                );
              }
          );


  }

  toNextQuestion() {
    if (index<questions.length-1) {

      setState(() {
        index++;
      });
    } else {
        showResult();
    }
  }

}