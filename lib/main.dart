import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// main app
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter-Tutorial",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void changeText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hello, world")),
      body: Column(
        children: <Widget>[const TestInputWidget(changeText(text)), Text(text)],
      ),
    );
  }
}

class TestInputWidget extends StatefulWidget {
  const TestInputWidget(void changeText, {super.key});
  final Function(String) callback;

  TestInputWidget([this.callback]);

  @override
  State<TestInputWidget> createState() => _TestInputWidgetState();
}

class _TestInputWidgetState extends State<TestInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {}

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a msg here",
          suffixIcon: IconButton(
            onPressed: click,
            icon: Icon(Icons.send),
            splashColor: Colors.grey,
            tooltip: "post message",
          )),
    );
  }
}
