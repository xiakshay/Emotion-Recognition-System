import 'package:flutter/material.dart';
import 'package:hers/screens/firstScreen.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key, Text? title}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Third Screen"),
          centerTitle: true,
        ),
        body: Center(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back Screen',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        )),
      );
}
