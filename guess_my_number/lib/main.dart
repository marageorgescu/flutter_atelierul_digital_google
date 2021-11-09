import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io' show Platform;

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
  String nr_tried_text = "";
  Random rand = new Random();
  int nr_generated = new Random().nextInt(100) + 1;
  bool textfield_enabled = true;
  String button_text = "Guess";
  //FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text("Guess my number"),
      ),
      body: Center(
        child: Column(
          children: [
           Container(
             margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
             child: Text(
               "I'm thinking of a number between 1 and 100.",
               textAlign: TextAlign.center,
               style: new TextStyle(
                 fontSize: 20,
               ),
             ),
           ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "It's your turn to guess my number!",
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Text(
              nr_tried_text,
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 15.0,
                top: 30.0,
                right: 15.0,
                bottom: 20.0,
              ),
              child: Card(
                elevation: 8.0,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "Try a number!",
                        style: new TextStyle(
                          fontSize: 35,
                          color: Colors.black45,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                        ),
                        child: TextField(
                          //focusNode: node,
                          enabled: textfield_enabled,
                          controller: myController,
                          decoration: InputDecoration(
                            errorText: errorContent(),
                          ),
                          keyboardType: Platform.isAndroid ? TextInputType.text : TextInputType.number,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (button_text == "Guess") {
                              showMessage(myController.text, context);
                            } else if (button_text == "Reset") {
                              button_text = "Guess";
                              textfield_enabled = true;
                              nr_tried_text = "";
                            }
                            //node.unfocus();
                            //FocusScope.of(context).requestFocus(node);
                            //textfield_enabled = false;
                            //textfield_enabled = true;
                          });

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(1, 125, 125, 125),
                          onPrimary: Colors.black54,
                          textStyle: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text(
                            button_text,
                        ),
                      ),
                    ],
                  ),
                ),
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
      return "please enter a number between 1 and 100";
    } else {
      return null;
    }
  }

  void showMessage(String s, BuildContext context) {
    if (isNumeric(s) == false || (isNumeric(s) == true &&
        (int.parse(myController.text) > 100 || int.parse(myController.text) < 1))) {
      nr_tried_text = "";
      validate = true;
    } else {
      if (int.parse(s) < nr_generated) {
        nr_tried_text = "You tried ${int.parse(s)}\nTry higher";
      } else if (int.parse(s) > nr_generated) {
        nr_tried_text = "You tried ${int.parse(s)}\nTry lower";
      } else {
        nr_tried_text = "You tried ${int.parse(s)}\nYou guessed right.";
        showAlertDialog(context);
      }
      validate = false;
    }

    myController.text = "";
  }

  showAlertDialog(BuildContext context) {
    Widget tryAgainButton = TextButton(
      child: const Text("Try again!"),
      onPressed:  () {
        setState(() {
          nr_tried_text = "";
          nr_generated = rand.nextInt(100) + 1;
          Navigator.pop(context);
        });
      },
    );
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed:  () {
        setState(() {
          textfield_enabled = false;
          button_text = "Reset";
          nr_generated = rand.nextInt(100) + 1;
          Navigator.pop(context);
        });
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("You guessed right"),
      content: Text("It was $nr_generated"),
      actions: [
        tryAgainButton,
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}

