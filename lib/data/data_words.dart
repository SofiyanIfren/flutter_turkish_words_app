import 'package:flutter/services.dart';
import '../models/word.dart';

Future<List<Word>> loadWords() async {
  final String response =
      await rootBundle.loadString('assets/data_turkish_words.json');
  final List<Word> words = wordFromJson(response);
  return words;
}
