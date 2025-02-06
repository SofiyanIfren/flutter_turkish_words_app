import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'data.dart';
import 'word.dart';

void main() {
  runApp(MultiWindowApp());
}

class MultiWindowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Window App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

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
        title: Text('Multi Window App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Word Cards'),
            Tab(text: 'Turkish Rules'),
            Tab(text: 'Additional Content'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          WordCardsScreen(),
          TurkishRulesScreen(),
          AdditionalContentScreen(),
        ],
      ),
    );
  }
}

// class WordCardsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Word Cards',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: WordCardsScreen(),
//     );
//   }
// }

class WordCardsScreen extends StatefulWidget {
  @override
  _WordCardsScreenState createState() => _WordCardsScreenState();
}

class _WordCardsScreenState extends State<WordCardsScreen> {
  List<Word> words = [];
  List<Word> filteredWords = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadWords().then((loadedWords) {
      setState(() {
        words = loadedWords;
        filteredWords = words;
      });
    });
  }

  void filterWords(String query) {
    setState(() {
      filteredWords = words.where((word) {
        final turkishLower = word.turkish.toLowerCase();
        final englishLower = word.englishMeaning.toLowerCase();
        final frenchLower = word.frenchMeaning.toLowerCase();
        final searchLower = query.toLowerCase();
        return turkishLower.contains(searchLower) ||
            englishLower.contains(searchLower) ||
            frenchLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Cards'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterWords,
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: filteredWords.length,
              itemBuilder: (context, index) {
                final word = filteredWords[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          word.turkish,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}

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
      },
    );
  }
}

class AdditionalContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Additional Content Screen'),
    );
  }
}
