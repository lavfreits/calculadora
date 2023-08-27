import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'calculator.dart';

void main() => runApp(const Calculator());

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter calculator',
      home: CalculatorPage(),
    );
  }
}
