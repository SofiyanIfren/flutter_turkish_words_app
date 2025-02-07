import 'package:flutter/material.dart';
import '../models/rule.dart';
import '../widgets/rule_card.dart';
import '../data/data_rules.dart';

class TurkishRulesScreen extends StatefulWidget {
  @override
  _RuleCardsScreenState createState() => _RuleCardsScreenState();
}

class _RuleCardsScreenState extends State<TurkishRulesScreen> {
  List<Rule> rules = [];

  @override
  void initState() {
    super.initState();
    loadRules().then((loadedRules) {
      setState(() {
        rules = loadedRules;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turkish Rules'),
      ),
      body: ListView.builder(
        itemCount: rules.length,
        itemBuilder: (context, index) {
          final rule = rules[index];
          return RuleCard(rule: rule);
        },
      ),
    );
  }
}
