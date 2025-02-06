import 'package:flutter/material.dart';

class RuleCard extends StatelessWidget {
  final Map<String, String> rule;

  RuleCard({required this.rule});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rule['title']!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              rule['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              rule['examples']!,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
