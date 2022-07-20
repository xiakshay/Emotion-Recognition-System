import 'package:flutter/material.dart';
import 'package:hers/screens/handGesture.dart';
import 'package:hers/screens/secondScreen.dart';
import 'package:hers/screens/thirdScreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key, Text? title}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("First Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondScreen()));
                  },
                  child: const Text(
                    'Second Screen',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HandGesture()));
                  },
                  child: const Text(
                    'Hand Gesture',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdScreen()));
                  },
                  child: const Text(
                    'Third Screen',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
