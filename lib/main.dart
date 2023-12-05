import 'package:bilgi_testi/test_data.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(const KnowledgeTest());
}

class KnowledgeTest extends StatelessWidget {
  const KnowledgeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Bilgi Testi',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey[200],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuestionPage(),
          ),
        ),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> selections = [];
  TestData test_1 = TestData();
  void buttonFunc(bool answer) {
    if (test_1.isTestOver() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Tebrikler!"),
            content: Text("Testi bitirdiniz. Puanınız: ${test_1.getScore()}"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: Text("Yeniden Başla"),
                onPressed: () {
                  test_1.resetScore();
                  Navigator.of(context).pop();
                  setState(() {
                    test_1.resetIndex();
                    selections = [];
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        if (test_1.getQuestAnswer() == answer) {
          selections.add(trueIcon);
          test_1.increaseScore();
        } else {
          selections.add(falseIcon);
        }
        test_1.increaseNum();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Container(
              width: 350,
              child: Center(
                child: Text(
                  test_1.getQuestText(),
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: selections,
          spacing: 8,
          runSpacing: 8,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.red),
                      ),
                      onPressed: () {
                        buttonFunc(false);
                      },
                      child: Icon(
                        Icons.clear,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.green),
                      ),
                      onPressed: () {
                        buttonFunc(true);
                      },
                      child: Icon(
                        Icons.check,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
