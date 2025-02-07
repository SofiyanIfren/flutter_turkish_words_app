// lib/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'word_cards_screen.dart';
import 'turkish_rules_screen.dart';
import 'conjugation_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Turkish'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Search Words'),
            Tab(text: 'Conjugation'),
            Tab(text: 'Specific Rules'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          WordCardsScreen(),
          ConjugationScreen(),
          TurkishRulesScreen(),
        ],
      ),
    );
  }
}
