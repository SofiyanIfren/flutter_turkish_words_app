import 'package:flutter/material.dart';
import '../models/conjugation.dart';
import '../widgets/conjugation_card.dart';
import '../data/data_conjugations.dart';

class ConjugationScreen extends StatefulWidget {
  @override
  _ConjugationScreenState createState() => _ConjugationScreenState();
}

class _ConjugationScreenState extends State<ConjugationScreen> {
  List<Conjugation> conjugations = [];

  @override
  void initState() {
    super.initState();
    loadConjugations().then((loadedConjugations) {
      setState(() {
        conjugations = loadedConjugations;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Turkish Verbs'),
        ),
        body: ListView.builder(
          itemCount: conjugations.length,
          itemBuilder: (context, index) {
            final conjugation = conjugations[index];
            return ConjugationCard(conjugation: conjugation);
          },
        ));
  }
}
