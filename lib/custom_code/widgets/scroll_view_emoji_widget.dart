// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ScrollViewEmojiWidget extends StatefulWidget {
  const ScrollViewEmojiWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _ScrollViewEmojiWidgetState createState() => _ScrollViewEmojiWidgetState();
}

class _ScrollViewEmojiWidgetState extends State<ScrollViewEmojiWidget> {
  List<String> mood = ["🤩", "😍", "🥺", "🤮", "😡"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: mood.map((moods) {
            return Container(
                height: 100,
                width: 150,
                alignment: Alignment.center,
                child: Text(moods));
          }).toList(),
        ));
  }
}
