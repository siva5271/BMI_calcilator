import 'package:flutter/material.dart';

import 'bottom_container.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmi, required this.description, required this.finalNote});
  final String bmi;
  final String description;
  final String finalNote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(
              child: Text(
                'YOUR RESULT:',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kInactiveCardColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      description,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 100, fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      finalNote,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContainer(
              description: 'RECALCULATE',
              uponClick: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
