import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(new MaterialApp(
      home: new MyHomePage()
  )
  );
}

class MyHomePage extends StatefulWidget {
  @override
  HomePage createState() {
    return new HomePage();
  }
}

class HomePage extends State<MyHomePage> {

  TextEditingController myController = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text("Number Shapes"),
      ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                "Please input a number to see if it is square or triangular.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                controller: myController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  errorText: errorContent(),
                ),
              ),

            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            showMessage(myController.text, context);
          });
        },
        child: Icon(
          Icons.check,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? errorContent() {
    if (validate == true) {
      return "Please enter a number";
    } else {
      return null;
    }
  }

  void showMessage(String s, BuildContext context) {
    if (isNumeric(s) == false) {
      validate = true;
    } else {
      validate = false;
      showAlertDialog(context);
    }
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text("${myController.text}"),
      content: Text(alertDialogContent(myController.text)),
      actions: [

      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) {
      myController.text = "";
    });

  }

  bool isSquare(int n) {
    return sqrt(n).round() * sqrt(n).round() == n;
  }

  bool isTriangular(int n) {
    return pow(n, 1/3).round() * pow(n, 1/3).round() * pow(n, 1/3).round() == n;
  }

  String alertDialogContent(String s) {
    if (isSquare(int.parse(s)) == false && isTriangular(int.parse(s)) == false) {
      return "Number $s is neither TRIANGULAR or SQUARE.";
    } else if (isSquare(int.parse(s)) == true && isTriangular(int.parse(s)) == false) {
      return "Number $s is SQUARE.";
    } else if (isSquare(int.parse(s)) == false && isTriangular(int.parse(s)) == true) {
      return "Number $s is TRIANGULAR.";
    } else {
      return "Number $s is both SQUARE and TRIANGULAR.";
    }
  }

}

