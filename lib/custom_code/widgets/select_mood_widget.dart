// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';

class SelectMoodWidget extends StatefulWidget {
  const SelectMoodWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _SelectMoodWidgetState createState() => _SelectMoodWidgetState();
}

class _SelectMoodWidgetState extends State<SelectMoodWidget> {
  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
        itemExtent: double.infinity,
        children: List.generate(
          6,
          (index) => AnimatedContainer(
              duration: Duration(milliseconds: 400),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "https://firebasestorage.googleapis.com/v0/b/chilli-mood.appspot.com/o/Assets%2Fangry.png?alt=media&token=e925c638-e8d6-4ffe-addb-69c75ec6df40"),
                ),
              )),
        ));
  }
}
