import 'dart:async';

import 'package:earables_app/stream_chart/stream_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utility/number_stream.dart';
import 'package:earables_app/stream_chart/widgets/stream_line_chart.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Start extends StatefulWidget {
  const Start({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  final List<FlSpot> flSpots = [];
  late final StreamSubscription<FlSpot> sub;

  @override
  void initState() {
    sub = NumberStream.getSinusStream
        .map((event) =>
            FlSpot(DateTime.now().millisecondsSinceEpoch.toDouble(), event))
        .listen((event) {
      setState(() {
        flSpots.add(event);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamChart<AccelerometerEvent>(
          stream: accelerometerEvents,
          handler: (event) => [event.x, event.y, event.z],
          maxValue: 20,
          minValue: -20,
          timeRange: Duration(seconds: 10),
        ),
      ),
    );
  }
}
