import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _mood = prefs.getStringList('ff_mood')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _mood;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _mood = [jsonDecode('{}')];
  List<dynamic> get mood => _mood;
  set mood(List<dynamic> _value) {
    _mood = _value;
    prefs.setStringList('ff_mood', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToMood(dynamic _value) {
    _mood.add(_value);
    prefs.setStringList('ff_mood', _mood.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMood(dynamic _value) {
    _mood.remove(_value);
    prefs.setStringList('ff_mood', _mood.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMood(int _index) {
    _mood.removeAt(_index);
    prefs.setStringList('ff_mood', _mood.map((x) => jsonEncode(x)).toList());
  }

  void updateMoodAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _mood[_index] = updateFn(_mood[_index]);
    prefs.setStringList('ff_mood', _mood.map((x) => jsonEncode(x)).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
