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
  final String conjugation;
  final String translation;

  ConjugationRow(
      {required this.person,
      required this.conjugation,
      required this.translation});

  factory ConjugationRow.fromJson(Map<String, dynamic> json) {
    return ConjugationRow(
      person: json['person'],
      conjugation: json['conjugation'],
      translation: json['translation'],
    );
  }
}
