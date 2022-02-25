import 'package:flutter/material.dart';
import 'package:startup_namer/list_word.dart';

void main() {
  runApp(const StartupNamer());
}

class StartupNamer extends StatelessWidget {
  const StartupNamer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text("Flutter Festival"),
        ),
        body: const Center(
          child: ListWord(),
        ),
      ),
    );
  }
}
