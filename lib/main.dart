import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  Color _color = Colors.red;
  double _fontSize = 20;

  changeColor() {
    int newIndex = (_index + 1) % 6;
    Color result = Colors.red;
    switch (newIndex) {
      case 1:
        result = Colors.green;
        break;
      case 2:
        result = Colors.blue;
        break;
      case 3:
        result = Colors.yellow;
        break;
      case 4:
        result = Colors.purple;
        break;
      case 5:
        result = Colors.pink;
        break;
      default:
        break;
    }
    double r = 60 + Random().nextDouble() * 100;
    setState(() {
      _index = newIndex;
      _fontSize = r;
      _color = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedDefaultTextStyle(
          style: TextStyle(color: _color, fontSize: _fontSize),
          duration: Duration(milliseconds: 300),
          onEnd: () => changeColor(),
          child: const Text(
            "Hello Flutter",
          ),
        ),
        ElevatedButton(onPressed: changeColor, child: Text("Click Me!"))
      ],
    );
  }
}
