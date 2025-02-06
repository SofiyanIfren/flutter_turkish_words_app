import 'dart:convert';

class Conjugation {
  final String tense;
  final List<ConjugationRow> rows;

  Conjugation({required this.tense, required this.rows});

  factory Conjugation.fromJson(Map<String, dynamic> json) {
    return Conjugation(
      tense: json['tense'],
      rows: (json['rows'] as List)
          .map((row) => ConjugationRow.fromJson(row))
          .toList(),
    );
  }
}

class ConjugationRow {
  final String person;
  final String suffix;
  final String translation;

  ConjugationRow(
      {required this.person, required this.suffix, required this.translation});

  factory ConjugationRow.fromJson(Map<String, dynamic> json) {
    return ConjugationRow(
      person: json['person'],
      suffix: json['suffix'],
      translation: json['translation'],
    );
  }
}
