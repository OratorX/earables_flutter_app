import 'package:flutter/material.dart';
import '../utility/number_stream.dart';

class Start extends StatelessWidget {
  const Start({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: NumberStream.getCounterStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("Counter: ${snapshot.data}");
            } else {
              return const Text("No data");
            }
          },
          initialData: 0,
        ),
      ),
    );
  }
}
