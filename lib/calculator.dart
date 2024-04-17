import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcMain extends StatefulWidget {
  const CalcMain({super.key});

  @override
  State<CalcMain> createState() => _CalcMainState();
}

class _CalcMainState extends State<CalcMain> {
  List<String> calculatorFunctions = [
    'AC',
    '+/-',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    '='
  ];

  String userInput = '';
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  String result = '0';
  String operator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3f3751),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.height / 1,
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        userInput,
                        style: GoogleFonts.robotoMono(
                          fontSize: 44,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                calculatorButtons(
                    const Color(0xFFaea9d1), 'AC', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFaea9d1), '+/-', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFaea9d1), '%', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFF576faf), '÷', 80, Colors.white, 28),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                calculatorButtons(
                    const Color(0xFFdcd9e2), '7', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '8', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '9', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFF576faf), 'x', 80, Colors.white, 28),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                calculatorButtons(
                    const Color(0xFFdcd9e2), '4', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '5', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '6', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFF576faf), '-', 80, Colors.white, 28),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                calculatorButtons(
                    const Color(0xFFdcd9e2), '1', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '2', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '3', 80, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFF576faf), '+', 80, Colors.white, 28),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                calculatorButtons(
                    const Color(0xFFdcd9e2), '0', 174, Colors.black, 22),
                calculatorButtons(
                    const Color(0xFFdcd9e2), '.', 80, Colors.black, 22),
                calculatorButtons(Colors.pink, '=', 80, Colors.white, 28),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget calculatorButtons(Color color, String calcButton, double width,
      Color textColor, double fontSize) {
    return GestureDetector(
      onTap: () {
        if (calcButton == 'AC') {
          result = '0';
          firstNumber = 0.0;
          secondNumber = 0.0;
          operator = "";
        } else if (calcButton == "+" ||
            calcButton == "-" ||
            calcButton == '÷' ||
            calcButton == "x") {
          firstNumber = double.parse(userInput);

          operator = calcButton;

          result = "0";
        } else if (calcButton == ".") {
          if (result.contains(".")) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Already conatains a decimals")));
            return;
          } else {
            result = result + calcButton;
          }
        } else if (calcButton == "=") {
          secondNumber = double.parse(userInput);

          if (operator == "+") {
            result = (firstNumber + secondNumber).toString();
          }
          if (operator == "-") {
            result = (firstNumber - secondNumber).toString();
          }
          if (operator == "x") {
            result = (firstNumber * secondNumber).toString();
          }
          if (operator == "÷") {
            result = (firstNumber / secondNumber).toString();
          }

          firstNumber = 0.0;
          secondNumber = 0.0;
          operator = "";
        } else {
          result = result + calcButton;
        }
        setState(() {
          userInput = double.parse(result).toStringAsFixed(2);
        });
      },
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: color,
              borderRadius: BorderRadius.circular(50)),
          margin: const EdgeInsets.all(6),
          width: width,
          height: 80,
          child: Center(
            child: Text(
              calcButton,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.robotoMono(fontSize: fontSize, color: textColor),
            ),
          )),
    );
  }
}
