import 'package:flutter/material.dart';

import 'package:esense_flutter/esense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BlueTooth"),),
      body: Center(
        child: ElevatedButton(
          child: Text("Hey"),
          onPressed: () {},
        ),
      ),
    );
  }
}
