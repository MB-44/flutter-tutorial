import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

// main class
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter-Tutorial",
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

// to display home page
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello, Flutter!"),
        ),
        body: const TestInputWidget());
  }
}

// This is for get the input
class TestInputWidget extends StatefulWidget {
  const TestInputWidget({Key? key}) : super(key: key);

  @override
  State<TestInputWidget> createState() => _TestInputWidgetState();
}

class _TestInputWidgetState extends State<TestInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello World!") {
      controller.clear();
      text = "";
    }
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.message), labelText: "Type a message"),
        onChanged: (text) => changeText(text),
      ),
      Text(text)
    ]);
  }
}
