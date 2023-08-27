import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String userQuestion;
  final String userAnswer;

  const Display(
      {super.key, required this.userQuestion, required this.userAnswer});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  userQuestion,
                  minFontSize: 20.0,
                  maxFontSize: 80.0,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  userAnswer,
                  minFontSize: 30.0,
                  maxFontSize: 80.0,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    fontSize: 80.0,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
