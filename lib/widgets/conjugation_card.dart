import 'package:flutter/material.dart';
import '../models/conjugation.dart';

class ConjugationCard extends StatelessWidget {
  final Conjugation conjugation;

  ConjugationCard({required this.conjugation});

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
              conjugation.tense,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Personne',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Suffixes (tr)',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Être (fr)',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                ...conjugation.rows.map((row) => TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row.person),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row.suffix),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(row.translation),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
