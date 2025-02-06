import 'package:flutter/material.dart';
import '../models/word.dart';

class WordCard extends StatelessWidget {
  final Word word;

  WordCard({required this.word});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              word.turkish,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              word.frenchMeaning,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              word.englishMeaning,
              style: TextStyle(fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}
