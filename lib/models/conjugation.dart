import 'dart:convert';

class Conjugation {
  final String tense;
  final List<ConjugationRow> rows;

  Conjugation({required this.tense, required this.rows});

  factory Conjugation.fromJson(Map<String, dynamic> json) {
    return Conjugation(
      tense: json['verb'],
      rows: (json['rows'] as List)
          .map((row) => ConjugationRow.fromJson(row))
          .toList(),
    );
  }
}

class ConjugationRow {
  final String pastTense;
  final String presentTense;
  final String futureTense;

  ConjugationRow(
      {required this.pastTense,
      required this.presentTense,
      required this.futureTense});

  factory ConjugationRow.fromJson(Map<String, dynamic> json) {
    return ConjugationRow(
      pastTense: json['pastTense'],
      presentTense: json['presentTense'],
      futureTense: json['futureTense'],
    );
  }
}
