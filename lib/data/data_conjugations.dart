// lib/data/conjugation_loader.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/conjugation.dart';

Future<List<Conjugation>> loadConjugations() async {
  final String response =
      await rootBundle.loadString('assets/data_turkish_conjugations.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Conjugation.fromJson(json)).toList();
}
