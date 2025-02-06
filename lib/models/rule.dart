import 'dart:convert';

List<Rule> ruleFromJson(String str) =>
    List<Rule>.from(json.decode(str).map((x) => Rule.fromJson(x)));

String ruleToJson(List<Rule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rule {
  Rule({
    required this.title,
    required this.description,
    required this.examples,
  });

  String title;
  String description;
  String examples;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        title: json["title"],
        description: json["description"],
        examples: json["examples"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "examples": examples,
      };
}
