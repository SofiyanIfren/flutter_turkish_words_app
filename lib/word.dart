import 'dart:convert';

List<Word> wordFromJson(String str) =>
    List<Word>.from(json.decode(str).map((x) => Word.fromJson(x)));

String wordToJson(List<Word> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Word {
  Word({
    required this.turkish,
    required this.englishMeaning,
    required this.frenchMeaning,
  });

  String turkish;
  String englishMeaning;
  String frenchMeaning;

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        turkish: json["Turkish"],
        englishMeaning: json["English meaning(s)"],
        frenchMeaning: json["French meaning(s)"],
      );

  Map<String, dynamic> toJson() => {
        "Turkish": turkish,
        "English meaning(s)": englishMeaning,
        "French meaning(s)": frenchMeaning,
      };
}
