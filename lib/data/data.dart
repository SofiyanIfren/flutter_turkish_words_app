import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/word.dart';

Future<List<Word>> loadWords() async {
  final String response = await rootBundle
      .loadString('assets/1000-most-common-words-in-Turkish.json');
  final List<Word> words = wordFromJson(response);
  return words;
}
