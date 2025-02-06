import 'package:flutter/material.dart';

import '../widgets/rule_card.dart';

class TurkishRulesScreen extends StatelessWidget {
  final List<Map<String, String>> rules = [
    {
      'title': 'Rule 1: Vowel Harmony',
      'description':
          'Turkish has a system of vowel harmony, where the vowels in a word must be either all front vowels or all back vowels.',
      'examples': 'Example: ev (house), kitap (book)',
    },
    {
      'title': 'Rule 2: Consonant Mutation',
      'description':
          'Certain consonants change form depending on the following vowel.',
      'examples': 'Example: kitap -> kitaba (to the book)',
    },
    // Add more rules as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rules.length,
      itemBuilder: (context, index) {
        final rule = rules[index];
        return RuleCard(rule: rule);
      },
    );
  }
}
