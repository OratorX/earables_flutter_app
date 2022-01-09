import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../utility/number_stream.dart';
import 'package:earables_app/stream_chart/widgets/stream_line_chart.dart';

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
      body: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(spots: flSpots),
          ],
        ),
      ),
    );
  }
}
