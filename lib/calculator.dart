import 'package:calculadora/widgets/display_widget.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'widgets/buttons.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  var userQuestion = '';
  var userAnswer = '';
  double previousResult = 0.0;
  bool isEqualPressed = false;
  String lastOperator = '';
  bool numberPressed = false;

  List<String> buttons = [
    'AC',
    '+/-',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    ',',
    'DEL',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Display(
              userQuestion: userQuestion,
              userAnswer: userAnswer,
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (buttons[index] == 'AC') {
                      return Button(
                          onTap: () {
                            setState(() {
                              userQuestion = '';
                              userAnswer = '';
                            });
                          },
                          nameButton: buttons[index],
                          colorBtn: Colors.deepPurple[200],
                          colorTxtBtn: Colors.deepPurple);
                    } else if (buttons[index] == '=') {
                      return Button(
                          nameButton: buttons[index],
                          colorBtn: Colors.deepPurple[600],
                          colorTxtBtn: Colors.white,
                          onTap: () {
                            if (!isEqualPressed) {
                              equalPressed();
                              isEqualPressed = true;
                              userQuestion += buttons[index];
                            }
                          });
                    } else if (buttons[index] == 'DEL') {
                      return Button(
                        nameButton: buttons[index],
                        colorBtn: Colors.deepPurple,
                        colorTxtBtn: Colors.white,
                        onTap: () {
                          setState(() {
                            userQuestion = userQuestion.isNotEmpty
                                ? userQuestion.substring(
                                    0, userQuestion.length - 1)
                                : '';
                          });
                        },
                      );
                    } else {
                      return Button(
                          nameButton: buttons[index],
                          colorBtn: isOperator(buttons[index])
                              ? Colors.deepPurple
                              : Colors.deepPurple[200],
                          colorTxtBtn: isOperator(buttons[index])
                              ? Colors.white
                              : Colors.deepPurple,
                          onTap: () {
                            setState(() {
                              if (isOperator(buttons[index])) {
                                if (numberPressed) {
                                  if (previousResult != 0.0 &&
                                      lastOperator != '' &&
                                      userQuestion != '' &&
                                      userAnswer != '') {
                                    userQuestion = previousResult.toString() +
                                        buttons[index];
                                    userAnswer = '';
                                    isEqualPressed = false;
                                    numberPressed = false;
                                  } else {
                                    userQuestion += buttons[index];
                                  }
                                }
                              } else {
                                userQuestion += buttons[index];
                                numberPressed = true;
                              }
                            });
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '%' ||
        x == '=' ||
        x == 'DEL') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll(',', '.');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();

    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      userAnswer = eval.toString();
      previousResult = eval;
      isEqualPressed = false;
      numberPressed = true;
    });
  }
}
