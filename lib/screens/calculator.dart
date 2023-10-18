import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  int num1 = 0;
  int num2 = 0;
  String texttodis = "";
  String res = "";
  String operator = "";

  void ButtonClick(String btnValue) {
    if (btnValue == 'AC') {
      num1 = 0;
      num2 = 0;
      texttodis = "";
      res = "";
      operator = "";
    } else if (btnValue == '+' ||
        btnValue == "-" ||
        btnValue == "x" ||
        btnValue == "÷") {
      num1 = int.parse(texttodis);
      res = "";
      operator = btnValue;
    } else if (btnValue == "=") {
      num2 = int.parse(texttodis);
      if (operator == "+") {
        res = (num1 + num2).toString();
      }
      if (operator == "-") {
        res = (num1 - num2).toString();
      }
      if (operator == "x") {
        res = (num1 * num2).toString();
      }
      if (operator == "÷") {
        res = (num1 / num2).toString();
      }
    } else {
      res = int.parse(texttodis + btnValue).toString();
    }

    setState(() {
      texttodis = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mybutton(String title, Color btnColor, Color textColor) {
      return Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                backgroundColor: btnColor),
            onPressed: () => ButtonClick(title),
            child: Text(
              title,
              style: TextStyle(color: textColor, fontSize: 22),
            )),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Calculator",
          style: TextStyle(color: const Color.fromARGB(255, 141, 138, 138)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$texttodis",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                mybutton(
                    'AC', Color.fromARGB(255, 177, 170, 170), Colors.black),
                mybutton('+', Color.fromARGB(255, 177, 170, 170), Colors.black),
                mybutton('÷', Color.fromARGB(255, 177, 170, 170), Colors.black),
                mybutton('÷', Color.fromARGB(255, 192, 173, 0), Colors.white),
              ],
            ),
            Row(
              children: [
                mybutton('7', Color(0xFF515151), Colors.white),
                mybutton('8', Color(0xFF515151), Colors.white),
                mybutton('9', Color(0xFF515151), Colors.white),
                mybutton('x', Color.fromARGB(255, 192, 173, 0), Colors.white),
              ],
            ),
            Row(
              children: [
                mybutton('4', Color(0xFF515151), Colors.white),
                mybutton('5', Color(0xFF515151), Colors.white),
                mybutton('6', Color(0xFF515151), Colors.white),
                mybutton('-', Color.fromARGB(255, 192, 173, 0), Colors.white),
              ],
            ),
            Row(
              children: [
                mybutton('1', Color(0xFF515151), Colors.white),
                mybutton('2', Color(0xFF515151), Colors.white),
                mybutton('3', Color(0xFF515151), Colors.white),
                mybutton('+', Color.fromARGB(255, 192, 173, 0), Colors.white),
              ],
            ),
            Row(
              children: [
                mybutton('0', Color(0xFF515151), Colors.white),
                mybutton('00', Color(0xFF515151), Colors.white),
                mybutton('.', Color(0xFF515151), Colors.white),
                mybutton('=', Color.fromARGB(255, 192, 173, 0), Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
