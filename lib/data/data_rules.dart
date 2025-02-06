import 'package:flutter/services.dart';
import '../models/rule.dart';

Future<List<Rule>> loadRules() async {
  final String response =
      await rootBundle.loadString('assets/data_turkish_rules.json');
  final List<Rule> words = ruleFromJson(response);
  return words;
}
