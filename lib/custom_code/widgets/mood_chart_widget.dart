// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MoodChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('mood_data').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Data processing and chart building here
          return buildMoodChart(snapshot.data!);
        } else {
          // Loading state
          return CircularProgressIndicator();
        }
      },
    );
  }

  SfCartesianChart buildMoodChart(QuerySnapshot snapshot) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        // Assuming "date" is a Timestamp in Firestore and "mood" is an integer field.
        LineSeries<DocumentSnapshot, DateTime>(
          dataSource: snapshot.docs,
          xValueMapper: (DocumentSnapshot data, _) => data['date'].toDate(),
          yValueMapper: (DocumentSnapshot data, _) => data['mood'],
          // Additional customization of the chart series can be done here.
        ),
      ],
    );
  }
}
