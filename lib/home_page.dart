import 'package:flutter/material.dart';
import 'package:flutter_quizz/quizz_page.dart';
import 'package:flutter_quizz/main.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;


    return Scaffold(
        appBar: AppBar(
          title: Text("Quizz Flutter")
        ),
        body: Center (
            child: Card (
              color: Colors.deepOrange.shade100,
              elevation: 10,
              margin:const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'images/cover.jpg',
                        height: height /2.5,
                        width: width/0.8,
                        fit: BoxFit.cover,
                      ),
                  ),
                  ElevatedButton(
                      onPressed: ((){
                        Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext ctx) {
                         return  QuizzPage();
                        }
                    ));
                  }),
                      child: const Text("Commencer le quizz"))
                  
                ],
              ),
            ),
          )
    );
  }
}
