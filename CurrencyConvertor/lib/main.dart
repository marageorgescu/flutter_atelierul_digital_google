import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  String amount = "";


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text("Currency convertor"),
      ),
      body: Center(
        child: Column(
          children: [
            const Image(
                image: NetworkImage(
                    "https://i0.1616.ro/media/2/2621/33243/20450766/1/9v8a2732.jpg?width=535"
                ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                    hintText: "enter the amount in EUR",
                    errorText: errorContent(),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isNumeric(myController.text) == false) {
                    amount = "";
                    validate = true;
                  } else {
                    amount = (double.parse(myController.text) * 4.5).toStringAsFixed(2) + " RON";
                    validate = false;
                  }
                });

              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(230, 215, 215, 215),
                onPrimary: Colors.black87,
              ),
                child: const Text("CONVERT!"),
            ),
            Text(
              amount,
              style: TextStyle(
                fontSize: 35,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
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
      return "please enter a number";
    } else {
      return null;
    }
  }
}

