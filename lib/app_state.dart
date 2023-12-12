import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _todaymood = prefs.getString('ff_todaymood') ?? _todaymood;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _todaymood = '';
  String get todaymood => _todaymood;
  set todaymood(String value) {
    _todaymood = value;
    prefs.setString('ff_todaymood', value);
  }

  int _todayMoodCount = 0;
  int get todayMoodCount => _todayMoodCount;
  set todayMoodCount(int value) {
    _todayMoodCount = value;
  }

  String _todayQuote = '';
  String get todayQuote => _todayQuote;
  set todayQuote(String value) {
    _todayQuote = value;
  }

  String _todayAuthor = '';
  String get todayAuthor => _todayAuthor;
  set todayAuthor(String value) {
    _todayAuthor = value;
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
